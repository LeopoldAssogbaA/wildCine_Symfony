<?php

namespace App\Repository;

use App\Entity\Films;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Doctrine\ORM\QueryBuilder;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Films|null find($id, $lockMode = null, $lockVersion = null)
 * @method Films|null findOneBy(array $criteria, array $orderBy = null)
 * @method Films[]    findAll()
 * @method Films[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FilmsRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Films::class);
    }

    /**
     * @return Query
     */
    public function findAllMoviesQuery(Films $search): Query
    {
          $query = $this->findMoviesQuery();

          if($search->getGenre()) {
            $query = $query->andWhere('p.genre = :genre');
            $query->setParameter('genre', $search->getGenre());
          }
          if($search->getTitre()) {
            $query = $query->andWhere('p.titre = :titre');
            $query->setParameter('titre', $search->getTitre());
          }

          return $query->getQuery();
    }

    /**
     * @return Films[]
     */
    public function findLatest(): array
    {
        return $this->findMoviesQuery()
            ->setMaxResults(4)
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getResult();
    }

    private function findMoviesQuery(): QueryBuilder
    {
        return $this->createQueryBuilder('p');
;
    }


//    /**
//     * @return Films[] Returns an array of Films objects
//     */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Films
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

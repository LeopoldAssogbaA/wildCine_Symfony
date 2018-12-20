<?php

namespace App\Controller;

use App\Entity\Films;
use App\Entity\FilmsSearch;
use App\Form\FilmsType;
use App\Form\FilmsGenreType;
use App\Repository\FilmsRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Knp\Component\Pager\PaginatorInterface;


class FilmsController extends AbstractController
{

    /**
     * @var FilmsRepository
     */
    private $repository;
    /**
     * @var ObjectManager
     */
    private $em;

    public function __construct(FilmsRepository $repository, ObjectManager $em)
    {
        $this->repository = $repository;
        $this->em = $em;
    }

    /**
     * @Route("/films", name="films.index")
     * @return Response
     */
    public function index(PaginatorInterface $paginator, Request $request): Response
    {
            $search = new Films();
            $form = $this->createForm(FilmsGenreType::class, $search);
            $form->handleRequest($request);

            $films = $paginator->paginate(
            $this->repository->findAllMoviesQuery($search),
            $request->query->getInt('page', 1)/*page number*/,
        12/*limit per page*/);

        return $this->render('films/index.html.twig', [
            'current_menu' => 'films',
            'films'        => $films,
            'form'         => $form->createView()
        ]);
    }

    /**
     * @Route("/films/{slug}-{id}", name="films.show", requirements={"slug": "[a-z0-9\-]*"})
     * @param Films $films
     * @return Response
     */
    public function show(Films $films, string $slug): Response
    {
        if ($films->getSlug() !== $slug) {
            return $this->redirectToRoute('films.show', [
                'id' => $films->getId(),
                'slug' => $films->getSlug()
            ], 301);
        }
        return $this->render('films/show.html.twig', [
            'films' => $films,
            'current_menu' => 'films'
        ]);
    }

}

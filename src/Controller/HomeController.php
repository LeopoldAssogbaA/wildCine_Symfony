<?php

namespace App\Controller;

use App\Repository\FilmsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     * @param FilmsRepository $repository
     * @return Response
     */
    public function index(FilmsRepository $repository): Response
    {
        $film = $repository->findLatest();
        return $this->render('pages/home.html.twig', [
            'film' => $film
        ]);
    }

}

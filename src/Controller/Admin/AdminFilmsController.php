<?php

namespace App\Controller\Admin;

use App\Entity\Films;
use App\Form\FilmsType;
use App\Repository\FilmsRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminFilmsController extends AbstractController
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
     * @Route("/admin", name="admin.films.index")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function index()
    {
        $films = $this->repository->findAll();
        return $this->render('admin/films/index.html.twig', compact('films'));
    }

    /**
     * @Route("/admin/films/create", name="admin.films.new")
     */
    public function new(Request $request)
    {
        $films = new Films();
        $form = $this->createForm(FilmsType::class, $films);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->em->persist($films);
            $this->em->flush();
            $this->addFlash('success', 'Bien créé avec succès');
            return $this->redirectToRoute('admin.films.index');
        }

        return $this->render('admin/films/new.html.twig', [
            'films' => $films,
            'form'     => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/films/{id}", name="admin.films.edit", methods="GET|POST")
     * @param Films $films
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function edit(Films $films, Request $request)
    {
        $form = $this->createForm(FilmsType::class, $films);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->em->flush();
            $this->addFlash('success', 'Bien modifié avec succès');
            return $this->redirectToRoute('admin.films.index');
        }

        return $this->render('admin/films/edit.html.twig', [
            'films' => $films,
            'form'     => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/films/{id}", name="admin.films.delete", methods="DELETE")
     * @param Films $films
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function delete(Films $films, Request $request) {
        if ($this->isCsrfTokenValid('delete' . $films->getId(), $request->get('_token'))) {
            $this->em->remove($films);
            $this->em->flush();
            $this->addFlash('success', 'Film supprimé avec succès');
        }
        return $this->redirectToRoute('admin.films.index');
    }

}

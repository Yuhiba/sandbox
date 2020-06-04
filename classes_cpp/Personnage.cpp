#include "Personnage.hpp"

Personnage::Personnage()
{
    nom = "Porygon";
    points_de_vie = 100;
    score = 0;
}

void Personnage::sePresenter()
{
    //affiche "je m'apelle" et après tu mets mon nom steplait
    std::cout << "Je m'apelle " << nom << std::endl;
}

void Personnage::gestionDesScores()
{
    printf("Mon niveau de score est de %d\n" , score);
}

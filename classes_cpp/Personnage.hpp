#ifndef PERSONNAGE
#define PERSONNAGE
#include <iostream>


class Personnage
{
    std::string nom;
    int points_de_vie;
    int score;
    public:
        Personnage();
        void sePresenter();
        void gestionDesScores();
};

#endif

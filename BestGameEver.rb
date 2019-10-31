class Personnage
	
	def initialize(pv = 0, attaque = 0, defense = 0)

	@pv_perso = pv
	@attaque_perso = attaque
	@defense_perso = defense

	end

	def pif(cible)
		cible.blessure(@attaque_perso)
	end

	def bloc
		@defense_perso = 3
		@defense_perso = @defense_perso*2
		sleep(0.5)
		puts "Vous vous réfugiez courageusement derrière votre bouclier..."
	end

	def super(cible)

	i = rand(2)
		if(i < 1)
		sleep(0.5)
			puts "Vous êtes bourré ou quoi ?"
		else
			cible.megablessure(@attaque_perso)
		end
	end

	def blessure(degats)
		degats = degats - @defense_perso
		if degats < 0
			degats = 0
		end
		@pv_perso = @pv_perso - degats
		sleep(0.5)
		puts "Vlan, vous perdez #{degats} pvs. Un pet de mouche..."
	end

	def megablessure(degats)
		degats = degats - @defense_perso + rand(5)
		if degats < 0
			degats = 0
		end
		@pv_perso = @pv_perso - degats
		sleep(0.5)
		puts "violent le bougre... #{degats} pv en moins et un t shirt ruiné"
	end

class Monster
	
	def initialize(pv = 0, attaque = 0, defense = 0)

		@pv_monster = pv
		@attaque_monster = attaque
		@defense_monster = defense 
	end

	def vlan(cible)
		cible.blessure(@attaque_monster)
	end

	def paf(cible)
		cible.megablessure(@attaque_monster)
	end

	def blessure(degats)
		degats = degats - @defense_monster
		@pv_monster = @pv_monster - degats
		sleep(0.5)
		puts "PIF ! le vilain monstre perd #{degats} points de vie !" 
	end

	def megablessure(degats)
		@pv_monster = @pv_monster - degats
		sleep(0.5)
		puts "Dans les dents ! #{degats} points de vie perdus!" 
	end
end

pvMechant = rand(50..100)
atqMonstre = rand(3..7)
defMonstre = rand(2..4)
a = 100
b = 5
c = 3

Monstre = Monster.new(pvMechant, atqMonstre, defMonstre)
Heros = Personnage.new(a, b, c)

if pvMechant < 65
	sleep(0.5)
	puts "Oh ! Un gobelin ! Qu'il est mignon..."	
elsif pvMechant >= 65 && pvMechant < 80
	sleep(0.5)
	puts "Un orc, basique et classique. il crie et il pue..."
elsif pvMechant >= 80 && pvMechant < 98
	sleep(0.5)
	puts "Un Troll des cavernes ! Vous aimeriez qu'il rajuste son pagne... il faut corriger ce goujat"
else 
	sleep(0.5)
	puts "Le boss final, tout simplement. Fuyez pauvre fou..."
end

sleep(0.5)
puts "La bête est formidable, #{pvMechant} points de vie, une force de frappe de #{atqMonstre} et #{defMonstre} de défense ! Il va falloir jouer serré..."

until pvMechant <= 0 || a <= 0 
	puts "Quelle action choisir ? (paf, block, super)"
		action = gets.chomp
	until action == "paf" || action == "block" || action == "super"
		action = gets.chomp
	end
	if action == "paf" 
		Heros.pif(Monstre)
	elsif action == "block"
		Heros.bloc
	elsif action == "super"
		Heros.super(Monstre)
	end

	sleep(0.5)
	puts "Le monstre s'énerve, attention..."
	sleep(0.5)
	a = rand(2)
	if a < 1
		Monstre.vlan(Heros)
	else
		Monstre.paf(Heros)
	end
end

if pvMechant <= 0 
	sleep(0.5)
	puts "Victoire !"
elsif a <= 0
	sleep(0.5)
	puts "La bête a eu raison de vous, les ménestrels chanteront pendant bien longtemps votre courage... et votre stupidité"
end
end

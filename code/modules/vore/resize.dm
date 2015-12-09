var/const/RESIZE_HUGE = 2
var/const/RESIZE_BIG = 1.5
var/const/RESIZE_NORMAL = 1
var/const/RESIZE_SMALL = 0.5
var/const/RESIZE_TINY = 0.25

//average
var/const/RESIZE_A_HUGEBIG = (RESIZE_HUGE + RESIZE_BIG) / 2
var/const/RESIZE_A_BIGNORMAL = (RESIZE_BIG + RESIZE_NORMAL) / 2
var/const/RESIZE_A_NORMALSMALL = (RESIZE_NORMAL + RESIZE_SMALL) / 2
var/const/RESIZE_A_SMALLTINY = (RESIZE_SMALL + RESIZE_TINY) / 2

//these aren't defines so they can stay in this file
//Not sure I see the point of them? They take up far more space than putting in the values as floats, and it's not like we're planning on changing them. --Night

/mob/var/playerscale = 1
/mob/var/basesize = 1

/mob/proc/resize(var/size_mod) //this proc resizes the mob immediately to the desired mod, it can be used by anything that calls it
	var/matrix/resize = matrix() // Defines the matrix to change the player's size

	resize.Scale(size_mod * basesize) //Change the size of the matrix

	if(size_mod >= RESIZE_NORMAL)
		resize.Translate(0, -1 * (1 - size_mod) * basesize * 16) //Move the player up in the tile so their feet align with the bottom

	animate(src,transform = resize, time = 5) //Animate the player resizing
	playerscale = size_mod //Change playerscale so that other items can interact with them

//Seem to have removed resize_by_item proc, which was necessary for shrink rays and such to work.

// Ace was here! Redid this a little so we'd use math for shrinking characters. This is the old code.
/mob/living/proc/set_size()
	set name = "Set character size"
	set category = "Resize"
	var/playersize = input("Size") in list("Macro", "Big", "Normal", "Small", "Tiny")
	switch(playersize)
		if("Macro")
			resize(RESIZE_HUGE)
		if("Big")
			resize(RESIZE_BIG)
		if("Normal")
			resize(RESIZE_NORMAL)
		if("Small")
			resize(RESIZE_SMALL)
		if("Tiny")
			resize(RESIZE_TINY)


/* When we add this to character customization, "short" will set you a little smaller basesize than normal, or "tall" for one that's a little larger than normal.
If a player choses "Small" "Tiny" "Big" or "Macro" and not "tall" or "short", they will be set as that size. Not change their basesize which will be 1.
If we change the basesize with other options it will cause bad results. "Tall" and "Short" will be purely within humanoid size ranges.
-Ace */

/mob/verb/resize_Readme()
	set name = "READ ME!!"
	set category = "Resize"
	usr << "<span class='alert'>DO NOT ABUSE THESE COMMANDS. At the start of the shift, you may set your size if you play a character of abnormal size. \
			However, DON'T ABUSE IT after you leave the arrival shuttle or this feature will be removed. -Ace</span>"

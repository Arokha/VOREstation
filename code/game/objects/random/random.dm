/obj/random
	name = "random object"
	desc = "This item type is used to spawn random objects at round-start"
	icon = 'icons/misc/mark.dmi'
	icon_state = "rup"
	var/spawn_nothing_percentage = 0 // this variable determines the likelyhood that this random object will not spawn anything


// creates a new object and deletes itself
/obj/random/New()
	..()
	if (!prob(spawn_nothing_percentage))
		spawn_item()
	del src


// this function should return a specific item to spawn
/obj/random/proc/item_to_spawn()
	return 0


// creates the random item
/obj/random/proc/spawn_item()
	var/build_path = item_to_spawn()
	return (new build_path(src.loc))


/obj/random/single
	name = "randomly spawned object"
	desc = "This item type is used to randomly spawn a given object at round-start"
	icon_state = "x3"
	var/spawn_object = null
	item_to_spawn()
		return ispath(spawn_object) ? spawn_object : text2path(spawn_object)


/obj/random/tool
	name = "random tool"
	desc = "This is a random tool"
	icon = 'icons/obj/items.dmi'
	icon_state = "welder"
	item_to_spawn()
		return pick(/obj/item/weapon/screwdriver,\
					/obj/item/weapon/wirecutters,\
					/obj/item/weapon/weldingtool,\
					/obj/item/weapon/crowbar,\
					/obj/item/weapon/wrench,\
					/obj/item/device/flashlight)


/obj/random/technology_scanner
	name = "random scanner"
	desc = "This is a random technology scanner."
	icon = 'icons/obj/device.dmi'
	icon_state = "atmos"
	item_to_spawn()
		return pick(prob(5);/obj/item/device/t_scanner,\
					prob(2);/obj/item/device/radio,\
					prob(5);/obj/item/device/analyzer)


/obj/random/powercell
	name = "random powercell"
	desc = "This is a random powercell."
	icon = 'icons/obj/power.dmi'
	icon_state = "cell"
	item_to_spawn()
		return pick(prob(10);/obj/item/weapon/cell/crap,\
					prob(40);/obj/item/weapon/cell,\
					prob(40);/obj/item/weapon/cell/high,\
					prob(9);/obj/item/weapon/cell/super,\
					prob(1);/obj/item/weapon/cell/hyper)


/obj/random/bomb_supply
	name = "bomb supply"
	desc = "This is a random bomb supply."
	icon = 'icons/obj/assemblies/new_assemblies.dmi'
	icon_state = "signaller"
	item_to_spawn()
		return pick(/obj/item/device/assembly/igniter,\
					/obj/item/device/assembly/prox_sensor,\
					/obj/item/device/assembly/signaler,\
					/obj/item/device/multitool)


/obj/random/toolbox
	name = "random toolbox"
	desc = "This is a random toolbox."
	icon = 'icons/obj/storage.dmi'
	icon_state = "red"
	item_to_spawn()
		return pick(prob(3);/obj/item/weapon/storage/toolbox/mechanical,\
					prob(2);/obj/item/weapon/storage/toolbox/electrical,\
					prob(1);/obj/item/weapon/storage/toolbox/emergency)


/obj/random/tech_supply
	name = "random tech supply"
	desc = "This is a random piece of technology supplies."
	icon = 'icons/obj/power.dmi'
	icon_state = "cell"
	spawn_nothing_percentage = 50
	item_to_spawn()
		return pick(prob(3);/obj/random/powercell,\
					prob(2);/obj/random/technology_scanner,\
					prob(1);/obj/item/weapon/packageWrap,\
					prob(2);/obj/random/bomb_supply,\
					prob(1);/obj/item/weapon/extinguisher,\
					prob(1);/obj/item/clothing/gloves/fyellow,\
					prob(3);/obj/item/stack/cable_coil,\
					prob(2);/obj/random/toolbox,\
					prob(2);/obj/item/weapon/storage/belt/utility,\
					prob(5);/obj/random/tool,\
					prob(2);/obj/item/weapon/tape_roll)

/obj/random/medical
	name = "Random Medicine"
	desc = "This is a random medical item."
	icon = 'icons/obj/items.dmi'
	icon_state = "brutepack"
	spawn_nothing_percentage = 25
	item_to_spawn()
		return pick(prob(4);/obj/item/stack/medical/bruise_pack,\
					prob(4);/obj/item/stack/medical/ointment,\
					prob(2);/obj/item/stack/medical/advanced/bruise_pack,\
					prob(2);/obj/item/stack/medical/advanced/ointment,\
					prob(1);/obj/item/stack/medical/splint,\
					prob(2);/obj/item/bodybag,\
					prob(1);/obj/item/bodybag/cryobag,\
					prob(2);/obj/item/weapon/storage/pill_bottle/kelotane,\
					prob(2);/obj/item/weapon/storage/pill_bottle/antitox,\
					prob(2);/obj/item/weapon/storage/pill_bottle/tramadol,\
					prob(2);/obj/item/weapon/reagent_containers/syringe/antitoxin,\
					prob(1);/obj/item/weapon/reagent_containers/syringe/antiviral,\
					prob(2);/obj/item/weapon/reagent_containers/syringe/inaprovaline,\
					prob(1);/obj/item/stack/nanopaste)


/obj/random/firstaid
	name = "Random First Aid Kit"
	desc = "This is a random first aid kit."
	icon = 'icons/obj/storage.dmi'
	icon_state = "firstaid"
	item_to_spawn()
		return pick(prob(3);/obj/item/weapon/storage/firstaid/regular,\
					prob(2);/obj/item/weapon/storage/firstaid/toxin,\
					prob(2);/obj/item/weapon/storage/firstaid/o2,\
					prob(1);/obj/item/weapon/storage/firstaid/adv,\
					prob(2);/obj/item/weapon/storage/firstaid/fire)


/obj/random/contraband
	name = "Random Illegal Item"
	desc = "Hot Stuff."
	icon = 'icons/obj/items.dmi'
	icon_state = "purplecomb"
	spawn_nothing_percentage = 50
	item_to_spawn()
		return pick(prob(3);/obj/item/weapon/storage/pill_bottle/tramadol,\
					prob(4);/obj/item/weapon/haircomb/fluff/cado_keppel_1,\
					prob(2);/obj/item/weapon/storage/pill_bottle/happy,\
					prob(2);/obj/item/weapon/storage/pill_bottle/zoom,\
					prob(5);/obj/item/weapon/contraband/poster,\
					prob(2);/obj/item/weapon/butterfly,\
					prob(3);/obj/item/weapon/cane/concealed,\
					prob(3);/obj/item/butterflyblade,\
					prob(3);/obj/item/butterflyhandle,\
					prob(3);/obj/item/weapon/wirerod,\
					prob(1);/obj/item/weapon/butterfly/switchblade,\
					prob(1);/obj/item/weapon/reagent_containers/syringe/drugs)


/obj/random/weapon // For Gateway maps and Syndicate. Can possibly spawn almost any gun in the game.
	name = "Random Illegal Weapon"
	desc = "This is a random illegal weapon."
	icon = 'icons/obj/gun.dmi'
	icon_state = "p08"
	spawn_nothing_percentage = 50
	item_to_spawn()
		return pick(prob(11);/obj/random/ammo_all,\
					prob(11);/obj/item/weapon/gun/energy/laser,\
					prob(10);/obj/item/weapon/twohanded/spear,\
					prob(10);/obj/item/weapon/gun/energy/stunrevolver,\
					prob(10);/obj/item/weapon/gun/energy/taser,\
					prob(10);/obj/item/weapon/gun/launcher/crossbow,\
					prob(10);/obj/item/weapon/gun/projectile/shotgun/doublebarrel,\
					prob(10);/obj/item/weapon/kitchenknife,\
					prob(10);/obj/item/weapon/kitchenknife/tacknife,\
					prob(10);/obj/item/weapon/kitchenknife/tacknife/unathiknife,\
					prob(10);/obj/item/weapon/butterfly,\
					prob(10);/obj/item/weapon/butterfly/switchblade,\
					prob(10);/obj/item/weapon/gun/projectile/hl2_pistol,\
					prob(10);/obj/item/weapon/gun/projectile/luger,\
					prob(10);/obj/item/weapon/gun/projectile/pipegun,\
					prob(10);/obj/item/weapon/gun/projectile/revolver,\
					prob(10);/obj/item/weapon/gun/projectile/revolver/detective,\
					prob(10);/obj/item/weapon/gun/projectile/revolver/mateba,\
					prob(10);/obj/item/weapon/gun/projectile/revolver/shotgun,\
					prob(11);/obj/item/weapon/gun/projectile/sec,\
					prob(10);/obj/item/weapon/gun/projectile/sec/wood,\
					prob(10);/obj/item/weapon/gun/projectile/shotgun/pump,\
					prob(10);/obj/item/weapon/gun/projectile/shotgun/pump/rifle,\
					prob(10);/obj/item/weapon/gun/projectile/shotgun/pump/rifle/mosin,\
					prob(10);/obj/item/weapon/melee/baton,\
					prob(10);/obj/item/weapon/melee/telebaton,\
					prob(10);/obj/item/weapon/melee/classic_baton,\
					prob(10);/obj/item/weapon/scythe,\
					prob(10);/obj/item/weapon/twohanded/baseballbat,\
					prob(10);/obj/item/weapon/twohanded/baseballbat/metal,\
					prob(9);/obj/item/weapon/gun/projectile/automatic/wt550/syndicate,\
					prob(9);/obj/item/weapon/gun/projectile/derringer,\
					prob(9);/obj/item/weapon/gun/energy/crossbow/largecrossbow,\
					prob(9);/obj/item/weapon/gun/projectile/automatic/mini_uzi,\
					prob(9);/obj/item/weapon/gun/projectile/fiveseven,\
					prob(9);/obj/item/weapon/gun/projectile/pistol,\
					prob(9);/obj/item/weapon/gun/projectile/shotgun/pump/combat,\
					prob(9);/obj/item/weapon/gun/projectile/hl2_pistol/silenced,\
					prob(9);/obj/item/weapon/twohanded/fireaxe,\
					prob(9);/obj/item/weapon/katana,\
					prob(9);/obj/item/weapon/claymore,\
					prob(9);/obj/item/weapon/kitchenknife/ritual,\
					prob(9);/obj/item/weapon/cane/concealed,\
					prob(9);/obj/item/weapon/gun/energy/gun,\
					prob(8);/obj/item/weapon/gun/energy/ionrifle,\
					prob(8);/obj/item/weapon/gun/energy/lasercannon,\
					prob(8);/obj/item/weapon/gun/energy/retro,\
					prob(8);/obj/item/weapon/gun/energy/gun/eluger,\
					prob(8);/obj/item/weapon/gun/energy/xray,\
					prob(8);/obj/item/weapon/gun/projectile/automatic/c20r,\
					prob(8);/obj/item/weapon/gun/projectile/automatic/stg,\
					prob(8);/obj/item/weapon/melee/energy/sword,\
					prob(8);/obj/item/weapon/gun/projectile/automatic/m41a,\
					prob(7);/obj/item/weapon/gun/energy/captain,\
					prob(7);/obj/item/weapon/gun/energy/gun/nuclear,\
					prob(7);/obj/item/weapon/gun/energy/sniperrifle,\
					prob(7);/obj/item/weapon/gun/projectile/automatic/p90,\
					prob(7);/obj/item/weapon/gun/projectile/automatic/shotgun,\
					prob(7);/obj/item/weapon/gun/projectile/automatic/battlerifle,\
					prob(7);/obj/item/weapon/gun/projectile/automatic/sts35,\
					prob(7);/obj/item/weapon/gun/projectile/automatic/z8,\
					prob(7);/obj/item/weapon/gun/projectile/shotgun/pump/unsc,\
					prob(7);/obj/item/weapon/gun/projectile/deagle,\
					prob(7);/obj/item/weapon/gun/launcher/grenade,\
					prob(6);/obj/item/weapon/gun/projectile/SVD,\
					prob(6);/obj/item/weapon/gun/projectile/automatic/l6_saw,\
					prob(5);/obj/item/weapon/gun/energy/pulse_rifle,\
					prob(3);/obj/item/weapon/gun/projectile/deagle/camo,\
					prob(2);/obj/item/weapon/gun/projectile/deagle/gold,\
					prob(1);/obj/item/weapon/gun/launcher/rocket,\
					prob(1);/obj/item/weapon/gun/projectile/gyropistol,\
					prob(1);/obj/item/weapon/gun/projectile/heavysniper,\
					prob(1);/obj/item/weapon/plastique)


/obj/random/energy
	name = "Random Energy Weapon"
	desc = "This is a random security weapon."
	icon = 'icons/obj/gun.dmi'
	icon_state = "energykill100"
	item_to_spawn()
		return pick(prob(2);/obj/item/weapon/gun/energy/laser,\
					prob(2);/obj/item/weapon/gun/energy/gun,\
					prob(1);/obj/item/weapon/gun/energy/stunrevolver)

/obj/random/projectile
	name = "Random Projectile Weapon"
	desc = "This is a random security weapon."
	icon = 'icons/obj/gun.dmi'
	icon_state = "revolver"
	item_to_spawn()
		return pick(prob(3);/obj/item/weapon/gun/projectile/shotgun/pump,\
					prob(2);/obj/item/weapon/gun/projectile/automatic/wt550,\
					prob(1);/obj/item/weapon/gun/projectile/shotgun/pump/combat)

/obj/random/handgun
	name = "Random Handgun"
	desc = "This is a random security sidearm."
	icon = 'icons/obj/gun.dmi'
	icon_state = "secgundark"
	item_to_spawn()
		return pick(prob(3);/obj/item/weapon/gun/projectile/sec,\
					prob(1);/obj/item/weapon/gun/projectile/sec/wood)


/obj/random/ammo
	name = "Random Ammunition"
	desc = "This is random ammunition."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "45-10"
	item_to_spawn()
		return pick(prob(6);/obj/item/weapon/storage/fancy/shotgun_ammo/beanbag,\
					prob(2);/obj/item/weapon/storage/fancy/shotgun_ammo/slug,\
					prob(4);/obj/item/weapon/storage/fancy/shotgun_ammo/pellet,\
					prob(1);/obj/item/weapon/storage/fancy/shotgun_ammo/stunshell,\
					prob(2);/obj/item/ammo_magazine/c45m,\
					prob(4);/obj/item/ammo_magazine/c45m/rubber,\
					prob(4);/obj/item/ammo_magazine/c45m/flash,\
					prob(2);/obj/item/ammo_magazine/mc9mmt,\
					prob(6);/obj/item/ammo_magazine/mc9mmt/rubber)

/obj/random/ammo_all
	name = "Random Ammunition (All)"
	desc = "This is random ammunition. Spawns all ammo types."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "666"
	item_to_spawn()
		return pick(prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/beanbag,\
					prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/pellet,\
					prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/flash,\
					prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/slug,\
					prob(5);/obj/item/ammo_magazine/a357,\
					prob(5);/obj/item/ammo_magazine/a762_clip,\
					prob(5);/obj/item/ammo_magazine/c45m,\
					prob(5);/obj/item/ammo_magazine/c45m/rubber,\
					prob(5);/obj/item/ammo_magazine/c38,\
					prob(5);/obj/item/ammo_magazine/c38/rubber,\
					prob(5);/obj/item/weapon/storage/box/flashbangs,\
					prob(4);/obj/item/ammo_magazine/c45,\
					prob(4);/obj/item/ammo_magazine/c9mm,\
					prob(4);/obj/item/ammo_magazine/mc9mm,\
					prob(4);/obj/item/ammo_magazine/mc9mmt,\
					prob(4);/obj/item/ammo_magazine/mc9mmt/rubber,\
					prob(4);/obj/item/ammo_magazine/c28mm,\
					prob(4);/obj/item/ammo_magazine/c45uzi,\
					prob(4);/obj/item/ammo_magazine/c45uzi/rubber,\
					prob(4);/obj/item/ammo_magazine/a10mmc,\
					prob(4);/obj/item/ammo_magazine/p90,\
					prob(4);/obj/item/ammo_magazine/m14,\
					prob(4);/obj/item/ammo_magazine/m14/large,\
					prob(4);/obj/item/ammo_magazine/c762,\
					prob(4);/obj/item/ammo_magazine/a556,\
					prob(4);/obj/item/ammo_magazine/a556/mid,\
					prob(4);/obj/item/ammo_magazine/a12mm,\
					prob(3);/obj/item/ammo_magazine/stg,\
					prob(3);/obj/item/ammo_magazine/a762,\
					prob(3);/obj/item/ammo_magazine/SVD,\
					prob(3);/obj/item/ammo_magazine/a50,\
					prob(3);/obj/item/weapon/storage/box/emps,\
					prob(2);/obj/item/ammo_magazine/battlerifle,\
					prob(1);/obj/item/ammo_casing/rocket,\
					prob(1);/obj/item/weapon/storage/box/sniperammo)


/obj/random/action_figure
	name = "random action figure"
	desc = "This is a random action figure."
	icon = 'icons/obj/toy.dmi'
	icon_state = "assistant"
	item_to_spawn()
		return pick(/obj/item/toy/figure/cmo,\
					/obj/item/toy/figure/assistant,\
					/obj/item/toy/figure/atmos,\
					/obj/item/toy/figure/bartender,\
					/obj/item/toy/figure/borg,\
					/obj/item/toy/figure/gardener,\
					/obj/item/toy/figure/captain,\
					/obj/item/toy/figure/cargotech,\
					/obj/item/toy/figure/ce,\
					/obj/item/toy/figure/chaplain,\
					/obj/item/toy/figure/chef,\
					/obj/item/toy/figure/chemist,\
					/obj/item/toy/figure/clown,\
					/obj/item/toy/figure/corgi,\
					/obj/item/toy/figure/detective,\
					/obj/item/toy/figure/dsquad,\
					/obj/item/toy/figure/engineer,\
					/obj/item/toy/figure/geneticist,\
					/obj/item/toy/figure/hop,\
					/obj/item/toy/figure/hos,\
					/obj/item/toy/figure/qm,\
					/obj/item/toy/figure/janitor,\
					/obj/item/toy/figure/agent,\
					/obj/item/toy/figure/librarian,\
					/obj/item/toy/figure/md,\
					/obj/item/toy/figure/mime,\
					/obj/item/toy/figure/miner,\
					/obj/item/toy/figure/ninja,\
					/obj/item/toy/figure/wizard,\
					/obj/item/toy/figure/rd,\
					/obj/item/toy/figure/roboticist,\
					/obj/item/toy/figure/scientist,\
					/obj/item/toy/figure/syndie,\
					/obj/item/toy/figure/secofficer,\
					/obj/item/toy/figure/warden,\
					/obj/item/toy/figure/psychologist,\
					/obj/item/toy/figure/paramedic,\
					/obj/item/toy/figure/ert)


/obj/random/plushie
	name = "random plushie"
	desc = "This is a random plushie."
	icon = 'icons/obj/toy.dmi'
	icon_state = "nymphplushie"
	item_to_spawn()
		return pick(/obj/structure/plushie/ian,\
					/obj/structure/plushie/drone,\
					/obj/structure/plushie/carp,\
					/obj/structure/plushie/beepsky,\
					/obj/item/toy/plushie/nymph,\
					/obj/item/toy/plushie/mouse,\
					/obj/item/toy/plushie/kitten,\
					/obj/item/toy/plushie/lizard)


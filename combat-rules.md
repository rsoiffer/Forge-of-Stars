---
layout: single
title: Combat Rules
sidebar:
  nav: system
---

Following are more advanced rules related to combat. See the {% ref All Powers %} page for a list of common actions you can take in combat.

## Multiple Attack Penalty

The more attacks you make beyond your first in a single turn, the less accurate you become, represented by the multiple attack penalty (MAP). Whenever you make an attack during your turn, you take a -5 penalty to your attack roll for each {% trait Attack %} power you've used so far this turn. Some weapons and abilities reduce MAPs, such as {agile} weapons, which reduce the penalty to -4 per attack.

Always calculate your MAP for the weapon you're using on the attack. For example, imagine you're wielding a chain flail in one hand and a bolter pistol (which has the agile trait) in the other. The first {Strike} you make during your turn has no penalty, no matter what weapon you are using. The second Strike will take a -5 penalty if you use the chain flail or a -4 penalty if you use the bolter pistol. The third Strike will take a -10 penalty if you use the chain flail or a -8 penalty if you use the bolter pistol, no matter what weapon you used for your previous Strikes.

## Range Penalty

Ranged and thrown weapons each have a listed range increment, and attacks with them grow less accurate against targets farther away. If the distance to your target is less than the listed range increment, you take no penalty to the attack roll. If you're attacking beyond that distance, you take a -5 penalty to the attack roll for each additional increment beyond the first. The {Take Aim} basic power reduces this penalty to -2 per range increment. You can attempt to attack up to six range increments away.

For example, the range increment of a blaster rifle is 120 feet. If you're shooting at a target within 120 feet, you take no penalty. If your target is between 120 and 240 feet, you take a -5 penalty. If your target is 240 to 360 feet away, you take a -10 penalty, and so on, until you reach the last range increment: if your target is 600 to 720 feet away, you take a -25 penalty.

As another example, imagine you're wielding a bowcaster sniper, which has a range increment of 250 feet, and you used the {Take Aim} power immediately before firing. If you're shooting at a target within 250 feet, you take no penalty. If you target is between 250 and 500 feet, you take a -2 penalty, and so on, until you reach the last range increment: if your target is 1250 to 1500 feet away, you take a -10 penalty.

## Explosives

Attacking with an area-effect explosive weapon works differently from normal attacks. Instead of choosing a target creature, choose a target point (if using a grid map, this point must lie on a grid intersection). Roll the explosive's damage, and deal that amount of damage to all creatures within the explosive's radius. Each creature in the explosion makes a Reflex save against a DC of 10 + your attack bonus. Since the DC is based on your attack bonus, any penalty to your attack roll (including MAP and range penalties) also applies to the DC of the explosive.

## Taking Cover

Having cover from enemy fire is extremely important in any gunfight. Whenever you're behind an object, you gain a bonus to AC, Reflex saves, and Stealth rolls against enemies on the other side of the cover. The size of the bonus depends on the quality of the cover, as shown in the table before. The {Take Cover} action doubles this bonus.

<table>
  <tr>
    <th>Type</th>
    <th>Bonus</th>
    <th>Examples</th>
  </tr>
  <tr>
    <td>Flimsy</td>
    <td>+1</td>
    <td>A lamppost, a thin sheet of metal, another creature</td>
  </tr>
  <tr>
    <td>Standard</td>
    <td>+2</td>
    <td>A sturdy pillar, a parked vehicle, a plaster wall</td>
  </tr>
  <tr>
    <td>Amazing</td>
    <td>+4</td>
    <td>A concrete barrier, an arrow slit, a military bunker</td>
  </tr>
</table>

## Surprise

If you start combat with a creature that isn't prepared for an imminent attack, that creature is surprised. A surprised creature cannot use actions during the first round of combat. Creatures that are surprised, that can't see you, or that otherwise aren't expecting you to attack are {flat-footed} against you.

## Movement Details

If you're using a grid during combat, one square generally corresponds to 5 feet. Because moving diagonally covers more ground, the first square of diagonal movement in a turn counts as 5 feet, the second counts as 10 feet, and further squares alternate between the two.

While you're climbing, swimming, or crawling, your Speed is halved. Climbing a vertical surface or swimming in rough water usually requires an {Athletics} roll.

### Difficult Terrain

Some terrain, like dense thorn bushes, uneven rocks, or slippery ice, is very difficult to move through. Your Speed is halved while you move through difficult terrain.

### Falling

If there is nothing supporting your character, you fall. You fall up to 500 feet per round. When you fall 10 or more feet, you take 1d6 damage for each 10 feet you fall, up to a cap of 50d6 damage. The number of dice is reduced by half if you fall onto a soft surface, such as a pile of hay or a pool of water. You land prone if you take any damage from a fall.

## Health

Your HP can never go above your maximum HP, and your HP can never go below 0. While your HP is exactly 0, you have the {downed} condition.

Some effects can give you temporary HP. When you take damage, subtract the damage from your temporary HP first, then subtract any remaining damage from your HP. Multiple sources of temporary HP **do not** stack, you only keep the highest.

Some effects can give you shield HP. When you take damage, subtract the damage from your shield HP first, then subtract any remaining damage from your HP or temporary HP. Multiple sources of shield HP **do** stack. Some effects that give you shield HP also replace your AC with the shield's AC.

## Dying

When you take damage that brings your HP to 0, you gain the {dying} 1 condition. If this damage was from an enemy's critical hit or a critical failure on your save, you instead gain the {dying} 2 condition. While you have the dying condition, you are bleeding out, and you must make a death save at the start of each of your turns. Other creatures can use the {Administer First Aid} power to try to stabilize you.

### Death Save

A death save is a {Fortitude} save against DC 10.

Critical Success
: Your dying condition decreases by 2

Success
: Your dying condition decreases by 1

Failure
: Your dying condition increases by 1

Critical Failure
: Your dying condition increases by 2

---
layout: single
title: Basic Rules
sidebar:
  nav: system
---

Following are some common rules for the game.

## Stats

Your character's stats are divided into two categories. **Attributes** represent your character's base abilities in various areas, and are added to skill rolls. **Derived statistics** are other values, and are usually determined by your attributes.

### Attributes
* **Strength (Str)**: How physically powerful you are. Good for feats of endurance, wrestling creatures, and attacking in melee.
* **Agility (Agi)**: How fast and nimble you are. Good for feats of acrobatics, dodging attacks, and being stealthy.
* **Precision (Pre)**: How well you can aim and react. Good for driving vehicles, firing guns, and reacting quickly to threats.
* **Intelligence (Int)**: How book-smart you are. Good for recalling information, casting magic spells, and repairing machines.
* **Wisdom (Wis)**: How much common sense you have. Good for noticing things, resisting mental manipulation, and some mystical abilities.
* **Charisma (Cha)**: How much force of personality you have. Good for persuading, deceiving, or leading other people and spirits.

### Derived Statistics
* **Level**: How strong your character is overall. Almost all characters are between level 1 and level 20, but this isn't a hard limit. The GM determines what level your character is.
* **Proficiency bonus (Prof)**: How much experience you have in your areas of expertise. Your Prof equals 1 + (Level / 4), rounded up. For instance, a level 1 character has a Prof of 2, a level 7 character has a Prof of 3, and a level 14 character has a Prof of 5.
* **Hit Points (HP)**: How much damage you can take before falling unconscious. Your HP is usually equal to Str + Prof + 5 * Level.
* **Armor Class (AC)**: How difficult you are to hit with attacks. Your AC is usually equal to 10 + Agility + Prof.
* **Initiative**: How quickly you react in combat. Your initiative is usually equal to Precision + Prof.
* **Speed**: How many feet you can move in a single action. Your speed is usually equal to 30 ft.

## Skill Rolls

Whenever your character does something that has a chance of failing, the GM may ask you to make a **skill roll**. The GM tells you which skill to roll, which determines the **bonus** you add to the roll. The GM also sets a **Difficulty Class** (DC) for the task. Some sample DCs are given in the Sample Difficulties table below.

Each skill is associated with one attribute. Your bonus for rolls with that skill is equal to your score in that attribute. If you are proficient in the skill, then you also add your proficiency bonus to rolls with that skill. Some items or abilities may add additional bonuses or penalties to your bonus.

When you make a skill roll, roll a d20 and add your bonus, and record the result. If your result is equal to or greater than the DC, then your roll is a **success**. If your result is equal to or greater than the DC + 10, then your roll is instead a **critical success**. If your result is lower than the DC, then your roll is a **failure**. If your result is lower than the DC - 10, then your roll is instead a **critical failure**. These four categories are known as the **levels of success**. They are ordered, from worst to best, as **critical failure < failure < success < critical success**. If you roll a 20 on the die, then your result is one level of success higher than it would normally be. If you roll a 1 on the die, then your result is one level of success lower than it would normally be.

### Sample Difficulties
<table>
  <tr>
    <th>Difficulty</th>
    <th>DC</th>
    <th>Examples</th>
  </tr>
  <tr>
    <td>Simple</td>
    <td>10</td>
    <td>Something a normal person could do with some effort</td>
  </tr>
  <tr>
    <td>Average</td>
    <td>15</td>
    <td>A task a skilled professional could struggle with</td>
  </tr>
  <tr>
    <td>Hard</td>
    <td>20</td>
    <td>Requires significant training to accomplish</td>
  </tr>
  <tr>
    <td>Very Hard</td>
    <td>25</td>
    <td>Very difficult even for a skilled professional</td>
  </tr>
  <tr>
    <td>Extremely Hard</td>
    <td>30</td>
    <td>Almost impossible except for the greatest masters alive</td>
  </tr>
  <tr>
    <td>Impossible</td>
    <td>40</td>
    <td>At the edge of human achievement, never been done before</td>
  </tr>
</table>

## Saving Throws

The three skills Fortitude Save, Reflex Save, and Will Save represent your character's ability to avoid or resist various types of attacks. Skill rolls made with these skills are called **saves** or **saving throws**. Unless otherwise specified, a saving throw against a damaging effect does the following:

<table>
  <tr>
    <th>Result</th>
    <th>Effect</th>
  </tr>
  <tr>
    <td>Critical Success</td>
    <td>You take no damage from the effect</td>
  </tr>
  <tr>
    <td>Success</td>
    <td>You take half the listed damage from the effect</td>
  </tr>
  <tr>
    <td>Failure</td>
    <td>You take the full damage listed from the effect</td>
  </tr>
  <tr>
    <td>Critical Failure</td>
    <td>You take double the listed damage from the effect</td>
  </tr>
</table>

## Attacking

Player characters are often involved in armed combat against enemies. When any character wants to make an attack, they follow the rules below.

### Attack Rolls
Every weapon is associated with a particular skill, such as Melee Weapons for a laser sword or Heavy Weapons for a blaster rifle. When you attack, make a special skill roll (called an **attack roll**) with the skill associated with the weapon you're attacking with. The DC for this skill roll is your target's AC. On a failure or critical failure, your attack misses or is blocked, and has no effect on your target. On a success, your attack is a hit. On a critical success, your attack is a critical hit, and deals double damage.

### Damage Rolls
When you hit an attack, you deal damage to your target. Your attack's damage and damage type is listed in the weapon's stat block. If you're making a melee attack, note the attribute you added to the attack roll, and add this attribute as a bonus to the attack's damage. If you're making a ranged attack, **do not** add this attribute to the attack's damage. Compute the total damage, and subtract this value from your target's HP. If this reduces your target's HP to 0, they are incapacitated.

### Explosives
Attacking with an area-effect explosive weapon works differently. Instead of choosing a target creature, choose a target point (if using a grid map, this point must lie on a grid intersection). Roll the explosive's damage, and deal that amount of damage to all creatures within the explosive's radius. Each creature in the explosion makes a Reflex save against a DC of 10 + your attack bonus (see the Saving Throws section above).

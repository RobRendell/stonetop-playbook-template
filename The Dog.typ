#import "playbook_lib.typ": *

/* Start editing here */

#let info = (
  title: "The Dog",
  description: "Humans have their good points, sure; they give good belly rubs, they have tasty treats. But they have so many weaknesses, too: cruelty, selfishness, faltering courage, wavering allegiance. Not you. Your loyalty is unshakable, and in the face of terrible danger, you will defend your pack.",
  image_path: "img/TheDog.png",
  max_hp: 18,
  stat_scores: [+2, +1, +1, +0, +0, -1],
  damage_die: "d6",
  starting_moves: "Just A Dog, 1 move from your Background and 1 of your choice",
  num_special_possessions: "Pick 2, in addition to your fangs",
  steading_name: "Stonetop",
  place_of_origin: "Stonetop is your home, or close enough. What name have its people bestowed on you? Who specifically gave it to you? Pick 1 (or make up something similar).",
)

#let stats = (
  Strength: "(STR)",
  Dexterity: "(DEX)",
  Intelligence: "(INT)",
  Wisdom: "(WIS)",
  Constitution: "(CON)",
  Charisma: "(CHA)",
)

#let backgrounds = (
  [
    == Working Dog
    You were born and bred in Stonetop. You work for your place, just like everyone else around here.

    You start with the Devotion move, and either several friendly homes or an owner (your choice) as an additional
    special possession. Go mark them now.

    When you *_Seek Insight by sniffing around a settlement_*, you can ask "What scent catches my nose, and where does
    it lead?" for free, even on a 6-. It will usually lead to something interesting.
  ],
  [
    == Wild-Born
    You were born in the wilds, but something about a person (or the people) of Stonetop has drawn you here and made you
    to adopt them. You start with the Beastongue move (go mark it now).

    What region were you originally from?
    #two_columns_checklist(condense: true, gutter: 2em)[
      - The Great Woods
      - The Flats
      - The Foothills
      - #fill_in_the_blank
    ]
    In this region, you have advantage to rolls to avoid its hazards, and guide others past them.
  ],
  [
    == Supernatural
    You are magical, whether innately or acquired. Start with the Not Just a Dog move (go mark it now).

    Your nature grants you a magical knack but also an ongoing downside (choose 1). You also have a tell, a hidden mark
    of your magical nature - what is it? When you *_focus briefly to use your knack_*, you create a short-lived effect,
    the stakes are always high, and your tell becomes visible for a few hours.
    #checklist(condense: true)[
      - An animate glamour of yourself, appearing and remaining within _near_ range (you remain visible). The touch of
        iron is painful to you.
      - A bark that compels prey or the unprepared to flinch, freeze or drop whatever they're holding (your choice).
        Domesticated herbivores are frightened in your presence.
      - A shroud of lightning that discharges into any that touch you (1d6, _forceful_). Storms make you hyperactive and
        your tell constantly visible.
      - All nearby spirits are roused to alertness, and you can touch and harm the insubstantial. Such spirits can
        always touch and harm you.
    ]
  ],
)

#let instincts = (
  [
    == Companionship
    To make friends, to offer comfort.
  ],
  [
    == Destruction
    To hunt and chase, to rip and tear.
  ],
  [
    == Obedience
    To follow orders, to seek direction.
  ],
  [
    == Play
    To run and romp and wrestle, to make mischief.
  ],
  [
    == Vigilance
    To watch over and protect your people.
  ],
  [
    == ~
    #linebreak()
  ],
)

#let appearances = (
  ("just a pup", "vigorous & energetic", "grayfur"),
  ("low growl", "playful bark", "mournful howl"),
  ("small & quick", "lean & rangy", "huge & muscular"),
  ("sleek coat", "curly hair", "shaggy fur", "wire-haired"),
)

#let origins_and_names = [
  - *A simple name*: Arrow, Bandit, Bear, Chaos, Dog, Dusty, Echo, Fang, Honey, Lucky, Mouse, Pepper, Poppy, Rover,
    Scout, Shadow, Spirit, Vigil, Wander, Whisky
  - *A human name*: Bleddyn, Cadi, Dafi, Del, Fychan, Gruff, Madog, Mared, Myfi, Nan, Siarl, Wynne
  #linebreak()
  Perhaps you also have a true name, a name you use only with other beasts and the spirits of the wild.
]

// These will have their checkboxes checked
// Set to none to not have any default possessions
#let default_special_possessions = [
  - *Fangs* #tags("hand", "grabby")
]

// Unchecked checkboxes
#let special_possessions = [
  - *#inv Armor*, made specially for you (1 armor).
  - *A backpack* made specially for you, which can hold small items and up to a Medium load.
  - *A bolt-hole*, crude but well-concealed, somewhere in the areas you roam.
  - *Friends*, 1-2 follower dogs #tags("alert", "keen-nosed", "fast") *HP* 6, *Damage* d6 #tags("hand", "grabby"),
    *Instinct:* to give chase. *Cost:* food and play.
  - *Secret stashes* (#uses(5) uses): questionable provisions and buried items throughout the areas you roam.
  - *An owner* #tags("kind", "lovable", "human-wise") *HP* 6, *Damage* d6, *Moves:* Use opposable thumbs, Interpret
    humanspeech and dogspeech, *Instinct:* to expect obedience. *Cost:* work and affection.
  - *Several friendly homes* in the village who will gladly take you in for the night.
  - *An indestructible toy*, imbued with great significance
  - *A very destructible toy*, imbued with great significance
  - #fill_in_the_blank (discuss with GM)
]

#let moves = (
  new_move(
    name: "Beastongue",
    requires: "the Dog",
    body: [
      While they are no more friendly, you can speak freely and clearly with natural beasts and Spirits of the Wild.
    ],
    children: (
      new_move(
        name: "Howl of the Pack",
        requires: "Beastongue",
        body: [
          When you *_unleash a howl for help in a wild place_*, roll +CHA. On a 7+ a nearby group of wild things will
          come to your aid. On a 10+ pick 2, on a 7-9 pick 1.
          - They arrive quickly (else they may take minutes).
          - They number half a dozen at least (else a few).
          - They will willingly leave after your need is past (else they will want something such as food).
        ],
      ),
      new_move(
        name: "Spirit Friend",
        requires: "Beastongue",
        body: [
          Most Spirits of the Wild regard you with affection, and you have advantage to Persuade them.
        ],
      ),
    ),
  ),
  new_move(
    name: "Devotion",
    requires: "the Dog",
    stock: 1,
    body: [
      When you spend the best part of a season with someone, you can give them your Devotion. When *_the holder of your
      Devotion pays attention to you_*, you can communicate non-verbally, using short, simple, direct sentences (as a
      player). Once per session when you *_Aid a holder of your Devotion_*, you can allow them to treat a 6- as a 7-9 or
      a 7-9 as a 10+.
    ],
    children: (
      new_move(
        name: "Just Whistle",
        requires: "Devotion",
        body: [
          When *_the holder of your Devotion is in a scene without you_*, you may barrel in at any time without
          explaining how you got there.
        ],
      ),
      new_move(
        name: "Everyone's Best Friend",
        requires: "Devotion",
        body: [
          You can give your Devotion to multiple people. If two holders of your Devotion are angrily at odds, mark
          _miserable_ until all is clearly well again.
        ],
      ),
    ),
  ),
  new_move(
    name: "Don't Kick the Dog",
    body: [
      When *_a person tries to injure you where others can see_*, roll +CHA. On a 7+, otherwise neutral onlookers will
      take your part. On a 10+, even the person's allies will wonder if they're the baddies.
    ],
  ),
  new_move(
    name: "Just A Dog",
    requires: "the Dog",
    checked: true,
    body: [
      You're a dog. You can't speak using language, and can only grasp objects with your mouth. Your night-vision, ears
      and nose are keen. When you *_follow a creature's recent scent trail_*, you follow until it is masked by water or
      a stronger scent. You can always ask the GM "Are my hackles rising due to something supernatural nearby" and get
      an honest answer.
    ],
  ),
  new_move(
    name: "Not Just a Dog",
    requires: "the Dog",
    body: [
      Magic is in your blood. You can discern magic and the nature of the supernatural in detail (tell us how). You gain
      Armor 3, bypassed by (GM chooses 1)
      #two_columns_checklist(condense: true, padX: 1em, gutter: 2em)[
        - Bronze
        - Black Iron
        - Fire
        - #fill_in_the_blank
      ]
    ],
    children: (
      new_move(
        name: "Healing Tongue",
        requires: "Not Just a Dog",
        body: [
          When you *_spend time licking someone who is Recovering_*, roll +WIS. On a 7+, they do not need to use
          supplies. On a 10+, also choose 1:
          - They regain an additional 4 HP.
          - Their condition improves more than expected.
        ],
      ),
      new_move(
        name: "Surge",
        requires: "Not Just a Dog",
        body: [
          When you *_tap into your magic to assist with a physical feat_* (running, jumping etc), describe what it looks
          like and roll +CON. On a 10+ choose 2, on a 7-9 choose 1:
          - You move much faster, leap much further etc.
          - You can keep going for hours.
          - Don't mark a debility when the surge ends.
        ],
      ),
    ),
  ),
  new_move(
    name: "Guard Dog",
    body: [
      When you *_Defend_*, hold 1 extra Readiness. Even on a 6-, hold 1 Readiness (plus whatever the GM says).
    ],
  ),
  new_move(
    name: "Hamstring",
    body: [
      When you *_Aid an ally to Clash and they deal damage_*, they can additionally either deal +1d4 damage or cause the
      enemy to gain the _slow_ tag.
    ],
  ),
  new_move(
    name: "Improved Stat",
    num_checkboxes: 3,
    body: [
      Each time you take this move, increase one of your stats by 1 (to a max of +2).
    ],
  ),
  new_move(
    name: "New Tricks",
    num_checkboxes: 2,
    requires: "level 2+ and the Dog",
    body: [
      Take a move from the Fox, Heavy, Ranger or Would-Be Hero playbooks for which you otherwise qualify, and that makes
      some sense for a dog. You can pick from a different playbook each time. You can't pick improved Stat or Superior
      Stat.
    ],
  ),
  new_move(
    name: "Nose for trouble",
    body: [
      When you *_sniff someone_*, you may ask their player "Are you up to no good?" and get an honest answer. If the
      answer is yes, they must also tell you whether they intend harm to you or those you care about.
    ],
  ),
  new_move(
    name: "Snarl",
    body: [
      When you *_Persuade by baring your fangs and growling_*, you have advantage, and what you want them to do or not
      do is clear to the target of your ire.
    ],
  ),
  new_move(
    name: "Torri Fell Down the Cistern?",
    body: [
      When *_someone's life is on the line_*, people understand your barks and body language more clearly. You can
      convey your meaning using simple language.
    ],
  ),
  new_move(
    name: "Who's the Best Dog?",
    body: [
      You improve the spirits of everyone around you. When *_your group stops to Recover and you are not miserable
      yourself_*, everyone who could reasonably do so can clear _miserable_.
    ],
  ),
  new_move(
    name: "Call the Hunt",
    requires: "level 6+ and Howl of the Pack",
    body: [
      When you *_scream a primal howl at night when in or near the Great Woods_*, take 1d6 damage (ignores armor) and
      roll +WIS. On a 7+, the Pale Hunter heeds your howl, and will soon manifest to hunt the quarry you name. On a 7-9,
      you are expected to lead the hunt.
    ],
  ),
  new_move(
    name: "Magical Beast",
    num_checkboxes: 2,
    requires: "level 6+ and Not Just a Dog",
    body: [
      Take a move from the Blessed, Lightbearer or Seeker playbooks for which you otherwise qualify, and that makes some
      sense for a magical dog. You can pick from a different playbook each time. You can't pick improved Stat or
      Superior Stat.
    ],
  ),
  new_move(
    name: "Mind Speech",
    requires: "level 6+, Devotion and Not Just a Dog",
    body: [
      You and the the holder of your Devotion can freely and privately speak mind-to-mind (up to _near_ range).
    ],
  ),
  new_move(
    name: "Premonition of Peril",
    requires: "level 6+ and Just Whistle",
    body: [
      You know if the holder of your Devotion is in peril, anywhere in the world. When you *_burst in on a scene where
      the holder of your Devotion is in peril_*, the action pauses for a moment at your dramatic entrance.
    ],
  ),
  new_move(
    name: "Strong Jaws",
    requires: "level 6+",
    body: [
      Increase your damage die to d8, and your fangs gain _messy_ and _piercing 1_.
    ],
  ),
  new_move(
    name: "Superior Stat",
    requires: "level 6+",
    body: [
      Increase one of your stats by +1 (to a max of +3).
    ],
  ),
  new_move(
    name: "Zephyr",
    requires: "level 6+ and Spirit Friend",
    body: [
      You gain a Spirit of the Wild (such as a wind spirit) as a Follower. Work with the GM to determine the details,
      including their Cost.
    ],
  ),
)

#let character_question_sections = (
  [
    = The Animals of Stonetop
    As well as other dogs, the village is home to many cats (alas), plus chickens, goats, sheep, pigs, and the two huge
    draft horses.

    How do the domesticated animals in Stonetop interact? (Choose 1)
    #checklist[
      - They can all speak with one another freely in a language that normal humans don't understand or even perceive as
        language.
      - Those of the same kind (e.g. dogs) can speak with one another, but not with others.
      - The vocalisations that domestic animals make to each other are nothing like language.
    ]
    #v(0.5em)

    What else strange or interesting have you noticed about the animals of Stonetop? (Choose 1 or more)
    #checklist[
      - The cats vanish from the village on the third night of each full moon, returning before dawn.
      - Herbivores that are allowed to graze on the Gwead get smarter, more cunning, more wild.
      - Some chickens seem to have a secret, with look-outs alerting the others when approached.
      - There's a pig that seems to be wise beyond its years, perhaps even oracular.
    ]
    #v(0.5em)

    More animal names: Acorn, Amber, Ash, Bastard, Bolt, Briar, Bucky, Chewer, Chunk, Climber, Cloud/y, Cluck, Curly,
    Drake, Fluffy, Frosty, Grazer, Gwead, Hairy, Ivy, Kid, Lady, Layer, Lord, Luna, Maker, Midnight, Mother, Mountain,
    Porky, Rat, Raven, Red, Smudge, Snort, Sprout, Snow/y, Storm/y, Sunny, Thunder, Titan, Willow, Wooly
  ],
  [
    = Something Buried
    Things get buried. Things get dug up. Both of these things are fun! But you dug up something buried in the village
    of Stonetop that wasn't so fun, in the fields perhaps, or beside a stone wall, you don't quite recall.

    Answer at least 2 of the following questions:
    #checklist[
      - What eerie thing drew your attention to the spot in the first place?
      #linebreak()
      - What made you dig, despite a sense of foreboding?
      #linebreak()
      - Why did you bury it again, quickly?
      #linebreak()
      - What half-seen thing escaped from the hole before you'd fully filled it in?
      #linebreak()
    ]
    Anyway, you buried it again, so everything's fine now, right? Ooh, is that a rabbit?
  ],
)

#let introductions = (
  "1": [
    On your first turn, *introduce yourself* by name, pronouns, background and appearance.
  ],
  "2": [
    On your second turn, *describe your special possessions*. If you have an NPC owner, name them.

    #linebreak()
    Tell us how you contribute to the village.
  ],
  "3": [
    On your third turn, *describe how the animals of Stonetop interact, and what you have noticed*. Then, *tell us about
    the buried thing*.
  ],
  "4": [
    On your next turn, *answer one of the following*, naming an animal or NPC who lives in Stonetop.
    #checklist[
      - Which village dog fights with you most often?
      #linebreak()
      - Which human villager always has a treat for you?
      #linebreak()
      - Which animal is most likely to stray from where the villagers want them?
      #linebreak()
      - Which animal most often terrorises the village children?
      #linebreak()
    ]
  ],
  "6": [
    On your next turn, *ask your fellow PCs one of these*. When others ask you, answer as you like, if it makes sense.
    #checklist[
      - Is one of you my owner?
      #linebreak()
      - Which of you suspects that I'm not a typical dog?
      #linebreak()
      - Which of you has fed me when my owner was not around?
      #linebreak()
      - Which of you did I bite once, and why?
      #linebreak()
    ]
  ],
  "8": [
    Add your owner's home to the steading playbook. When everyone is done, let spring break forth!
  ],
)

// e.g. #let footnotes = ( "3": [* The first time you use any move marked with an asterisk (*), cross off “Would-be” on the front page.])
#let footnotes = (
  "1": [
    Paw image by Lorc of game-icons.net and released under a CC BY 3.0 license.
  ],
  "4": [
    Contributors: Brynden_rivs_esq, Matt Wetherbee, GarthS, \[thirty\], Blazer19, Luke and Rob Rendell.
  ],
)


#let playbook_advice = (
  "1": [
    *Ask them the following:*
    - How quickly do you age? At the same rate as a normal dog (~7 times human), or at a different rate? Or do you not
      even know yet?
  ],
  backgrounds: (
    [
      == Working Dog
      - What work do you do? Guide dog, herdsdog, hunting dog, watch dog, something else?
      - Are your dam and sire still alive? Are they still working?
      - How many of your litter-mates still live in Stonetop? Do you see them often?
      - Which dog (or perhaps other animal) did you grow up always playing with?
    ],
    [
      == Wild-Born
      - Is your old pack still out there in the wild? How would they react if they met you again?
      - What drew you to Stonetop? What ties you to the village?
      - When did you first make yourself known? How did you convince the villagers to let you stay?
      - Who in the village fears that you are still wild, not to be trusted?
    ],
    [
      == Supernatural #linebreak()
      The Supernatural Dog's "tell" is a visible, obviously supernatural feature that is normally hidden, revealed by
      when they use their knack. For example, their eyes might glow, their coat might change to some colour no natural
      dog has, sparks might rise from their fur etc.
      - Tell us all about your tell.
      - If you were always magical, do you know the source of your magic, or is your origin a mystery to you? How and
        when did you arrive in Stonetop?
      - If something changed you, when did it happen, and how has your life changed since gaining your powers?
      - Does anyone in the village know what you can do? If so, who, and how do they treat you now?

      Note that while activating their knack does not involve a roll, the stakes are always high when they do, meaning
      they're more likely to trigger Defy Danger (or some other move).
    ],
  ),
  "2": [
    *If they have...* #linebreak()
    == Armor, a backpack, a toy
    - Who made it for you? Who looks after it when you're not using it?
    - Is there a tradition of making such things in Stonetop, or is yours the only one?
    == A bolt-hole
    - Don't define where it is exactly, but how did you come to find or dig out this hidden place?
    == Friends
    - Are the other dogs your litter-mates? If not, how did you meet?
    - Why are you such good friends? Tell us a story about your adventures together.
    - Do they live in the village and have owners of their own? How free are they to leave with you?
    == Several friendly homes
    - Did you do something special to win these villager's hearts? Or are they just dog-lovers who would take in any
      stray?
    - How many homes are friendly? Give us the name of the householder of at least one of them.
    == An owner
    - What is their name?
    - Do they have family that lives with them, and if so, how do you get on with these others?
    - How did you come to be looked after by such a kind human?
  ],
  "3": [
    == Animals of Stonetop

    The Dog is quite limited in their ability to communicate freely with human villagers, so the first question gives
    the player significant control over whether they have NPCs to speak with or not.

    - Do the dogs of the village accept you as one of them? If not, what is their attitude?
    - Is your relationship with other kinds of animals in the village typical of a dog? If not, how so?
    - Are any human villagers aware of any of the strange or interesting things that you noticed?
    - How do the animals react to the Stone (indifferent, spooked, defensive, something else)? Do different kinds react
      differently? What about when it pulls lightning from the sky?
    - You can understand human speech, at least when they speak of concrete things. What about the other animals in the
      village?

    == Something Buried

    What is buried should be left unspecified. The player doesn't say what it was, just how it made them feel.

    - How long ago was it that you dug up and then buried the thing?
    - Has anything changed since then, that you've noticed?

  ],
  "4": none,
  "5": [
    *Before moving on to step 6, if it's not already clear ask:*
    - Do you have a mate? Any puppies?
  ],
  "6": none,
  "7": none,
  "8": [
    - If you don't have an owner, where do you live?
    - Why is your owner's/your home there, as opposed to somewhere else?
  ],
)

/* Don't edit beyond here */

#let playbook = (
  info: info,
  stats: stats,
  backgrounds: backgrounds,
  instincts: instincts,
  appearances: appearances,
  origins_and_names: origins_and_names,
  default_special_possessions: default_special_possessions,
  special_possessions: special_possessions,
  moves: moves,
  character_question_sections: character_question_sections,
  introductions: introductions,
  footnotes: footnotes,
  playbook_advice: playbook_advice,
  marginY: 0.2in,
)

#import "stonetop_style.typ": stonetop_style

#show: stonetop_style

#make_playbook(..playbook)

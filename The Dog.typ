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
    You are a dog of Stonetop. You work for your place, just like everyone else around here. What do you do?

    #two_columns_checklist(condense: true, gutter: 2em)[
      - Caravan dog
      - Guide dog
      - Herdsdog
      - Hunting dog
      - Watch dog
    ]
    #linebreak()
    When you *_Seek Insight by sniffing around a settlement_*, you can ask "What is the strongest smell here, and what
    is its source?" for free, even on a 6-. The answer can be metaphorical.

    You start with the Devotion move (go mark it now).
  ],
  [
    == Wild-Born
    You were born in the wilds, but something about a person (or the people) of Stonetop has drawn you to adopt them.
    What region were you originally from?
    #two_columns_checklist(condense: true, gutter: 2em)[
      - The Great Woods
      - The Flats
      - The Foothills
      - #fill_in_the_blank
    ]
    In this region, you have advantage to Forage (other than in Winter) and to travel safely.

    You start with the Beastongue move (go mark it now).
  ],
  [
    == Supernatural
    You were sent to Stonetop for a Purpose. What type of being sent you?
    #two_columns_checklist(condense: true, gutter: 2em)[
      - A Fae
      - A God
      - A Maker (?)
      - A Spirit
      - A Thing Below
      - #fill_in_the_blank
    ]
    Do you know of this being, or is your origin a mystery to you?

    Choose your Purpose, and decide the details now or later.
    #checklist[
      - Hunter (what is your quarry?)
      - Guardian (who or what are you protecting?)
      - Portent (what do you portend?)
    ]
    You have advantage on rolls related to your Purpose.

    You start with the Not Just a Dog move (go mark it now).
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
  - *A good reputation* with nearly every villager who dwells in Stonetop.
  - *Secret stashes* (#uses(5) uses): questionable provisions and buried items throughout the areas you roam.
  - *An owner* #tags("kind", "lovable", "human-wise") *HP* 6, *Damage* d6, *Moves:* Use opposable thumbs, Interpret
    humanspeech and dogspeech, *Instinct:* to expect obedience. *Cost:* work & affection.
  - *#inv A dog coat #tags[warm]*
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
    name: "Improved Stat",
    num_checkboxes: 3,
    body: [
      Each time you take this move, increase one of your stats by 1 (to a max of +2).
    ],
  ),
  new_move(
    name: "Just A Dog",
    requires: "the Dog",
    checked: true,
    body: [
      You're a dog. You can't manipulate objects or speak in the ways humans can, and can generally only carry one item
      at a time (in your mouth). When you *_follow a creature's recent scent trail_*, you follow until it is masked by
      water or a stronger scent. *_In the presence of the supernatural_* your hackles rise. Once per session when *_your
      canine nature causes offense or difficulty_*, mark XP.
    ],
  ),
  new_move(
    name: "Not Just a Dog",
    requires: "the Dog",
    body: [
      Whether innately or acquired, you have a magical nature. Gain Armor 3, bypassed by (GM chooses 1)
      #two_columns_checklist(condense: true, padX: 1em, gutter: 2em)[
        - Bronze
        - Black Iron
        - Fire
        - #fill_in_the_blank
      ]
    ],
    children: (
      new_move(
        name: "Magic Tongue",
        requires: "Not Just a Dog",
        body: [
          When you *_spend time licking someone who is Recovering_*, roll +WIS. On a 7+, they do not need to use
          supplies. On a 10+, also choose 1:
          - They regain an additional 4 HP.
          - Their condition improves more than expected.
        ],
      ),
      new_move(
        name: "Scent of Magic",
        requires: "Not Just a Dog",
        body: [
          You can recognise and distinguish the scents of different types of magic and unnatural beings. When you *_Seek
          Insight_*, you can ask "What magic can I smell?" as one of your options.
        ],
      ),
    ),
  ),
  new_move(
    name: "Hamstring",
    body: [
      When you *_Aid an ally to Clash and they inflict harm_*, they can additionally either deal +1d4 damage or cause
      the enemy to gain the _slow_ tag.
    ],
  ),
  new_move(
    name: "New Tricks",
    num_checkboxes: 2,
    requires: "level 2+ and the Dog",
    body: [
      Take a move from the Fox, Heavy, Ranger or Would-Be Hero playbooks for which you otherwise qualify, and that makes
      some sense for you as a dog. You can pick from a different playbook each time. You can't pick improved Stat or
      Superior Stat.
    ],
  ),
  new_move(
    name: "Nose for trouble",
    body: [
      When you *_sniff someone_*, you may ask their player "Are you hiding something?" OR "Are you up to no good?" and
      get an honest answer. If the answer is yes, they must also tell you whether they intend harm to you or those you
      care about.
    ],
  ),
  new_move(
    name: "Roll Over",
    body: [
      If you *_roll over onto your back_*, no enemy will consider you a threat as long as you remain supine. If you
      *_try to quickly do something non-violent that requires you to stand_*, roll +DEX. On a 10+, you can do the thing
      and return to your back before anyone notices. On a 7-9, you can do the thing OR return to your back before anyone
      notices, your choice.
    ],
  ),
  new_move(
    name: "Throw a Bone",
    body: [
      When you *_whine piteously because you want something that a nearby character has the power to give you_*, your
      wish is always clear. You have advantage to Persuade them to give it to you.
    ],
  ),
  new_move(
    name: "Torri Fell Down the Cistern?",
    body: [
      When *_someone's life is on the line_*, people understand your barks and body language more clearly. You can
      convey your meaning using simple language.
    ],
  ),
  //  new_move(
  //    name: "Who's the Best Dog?",
  //    body: [
  //      You improve the spirits of everyone around you. When *_your group stops to Recover and you are not miserable_*,
  //      everyone else in your party can clear _miserable_.
  //    ],
  //  ),
  new_move(
    name: "Call the Hunt",
    requires: "level 6+ and Howl of the Pack",
    body: [
      When you *_scream a primal howl at night when in or near the Great Woods_*, take 1d6 damage (ignores armor) and
      roll +WIS. On a 7+, the Pale Hunter heeds your howl, and will soon manifest to hunt the quarry you name. On a 7-9,
      the Hunter expects you to lead the hunt.
    ],
  ),
  new_move(
    name: "Magical Beast",
    num_checkboxes: 2,
    requires: "level 6+ and Not Just a Dog",
    body: [
      Take a move from the Blessed, Lightbearer or Seeker playbooks for which you otherwise qualify, and that makes some
      sense for you as a dog. You can pick from a different playbook each time. You can't pick improved Stat or Superior
      Stat.
    ],
  ),
  new_move(
    name: "Mind Speech",
    requires: "level 6+ and Devotion",
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
      - The vocalisations of domestic animals with one other are nothing like language.
    ]
    #v(0.5em)

    Do the domesticated animals of the village accept you as just another dog? Or are you an outsider, regarded as
    strange or unnatural? Perhaps you get on unusually well with some kinds but not others. Detail your standing with
    the village animals.
    #v(2em)

    How do the animals react to the Stone? Are they indifferent, spooked, defensive, something else? What about when it
    pulls lightning from the sky? Do different kinds react differently?
    #v(2em)

    More animal names: Acorn, Amber, Ash, Bastard, Bolt, Briar, Bucky, Chewer, Chunk, Climber, Cloud/y, Cluck, Curly,
    Drake, Fluffy, Frosty, Grazer, Gwead, Hairy, Ivy, Kid, Lady, Layer, Lord, Luna, Maker, Midnight, Mother, Mountain,
    Porky, Rat, Raven, Red, Smudge, Snort, Sprout, Snow/y, Storm/y, Sunny, Thunder, Titan, Willow, Wooly
  ],
  [
    = Something Buried
    Things get buried. Things get dug up. Both of these things are fun! But you found something buried under the village
    of Stonetop that wasn't so fun, in the fields perhaps, or beside a stone wall, you don't quite recall.

    Answer at least 2 of the following questions:
    #checklist[
      - What eerie thing drew your attention to the spot initially?
      #linebreak()
      - What sensation did you feel when you uncovered what was buried?
      #linebreak()
      - Why did you bury it again, quickly?
      #linebreak()
      - What half-seen other thing came out of the hole before you'd fully filled it in?
      #linebreak()
    ]
    Anyway, you buried it again, so everything's fine now, right? Ooh, was that a rabbit?
  ],
)

#let introductions = (
  "2": [
    On your second turn, *describe your special possessions*. If you have an NPC owner, name them.

    #linebreak()
    Tell us how do you contribute to the village.
  ],
  "3": [
    On your third turn, *describe how the animals of Stonetop interact with one other, with you and with the Stone*.
    Then, *tell us about the buried thing*.
  ],
  "4": [
    On your next turn, *answer one of the following*, naming an animal or NPC who lives in Stonetop.
    #checklist[
      - With which village dog do you most often fight?
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
      - Which of you believes that I'm not a typical dog?
      #linebreak()
      - Which of you do all the animals of the village seem to love?
      #linebreak()
      - Which of you has fed me when my owner was not around?
      #linebreak()
      - Which of you did I bite once?
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
    Dog Playbook contributors: Brynden_rivs_esq, Matt Wetherbee, GarthS and Rob Rendell.

    Paw image by Lorc of game-icons.net and released under a CC BY 3.0 license.
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
  marginY: 0.2in,
)

#import "stonetop_style.typ": stonetop_style

#show: stonetop_style

#make_playbook(..playbook)

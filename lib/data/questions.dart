import '../models/question.dart';

// NOTE: these are original practice questions written for the demo.
// Replace/extend them with your own content (do not copy College Board material).

const List<String> categories = [
  'Inferences',
  'Words in Context',
  'Text Structure & Purpose',
  'Cross-Text Connections',
  'Central Ideas',
  'Command of Evidence',
];

const List<StudyPlan> studyPlans = [
  StudyPlan(
    title: 'Inference warm-up',
    subtitle: '10-minute burst  |  Easy',
    category: 'Inferences',
    difficulty: Difficulty.easy,
  ),
  StudyPlan(
    title: 'Vocabulary push',
    subtitle: '15-minute burst  |  Hard',
    category: 'Words in Context',
    difficulty: Difficulty.hard,
  ),
];

const List<Question> allQuestions = [
  // ---------- Inferences ----------
  Question(
    id: 'inf1',
    category: 'Inferences',
    difficulty: Difficulty.easy,
    passage:
        'Marta checked the forecast, packed an umbrella, and left her sunglasses at home.',
    prompt: 'Which choice can most logically be inferred from the text?',
    options: [
      'Marta expected rain that day.',
      'Marta dislikes wearing sunglasses.',
      'Marta was running late.',
      'Marta lives near the ocean.',
    ],
    correctIndex: 0,
    explanation:
        'Checking the forecast and packing an umbrella points to expected rain. The other choices add details the text never supports.',
  ),
  Question(
    id: 'inf2',
    category: 'Inferences',
    difficulty: Difficulty.medium,
    passage:
        'In towns where the library extended its evening hours, the number of teenage visitors rose sharply, while daytime visits by adults stayed roughly the same.',
    prompt: 'Which choice is most strongly supported by the text?',
    options: [
      'Extended evening hours made the library more accessible to teenagers.',
      'Adults prefer to visit libraries in the evening.',
      'Teenagers prefer libraries to schools.',
      'Libraries should reduce their daytime hours.',
    ],
    correctIndex: 0,
    explanation:
        'Only teen visits changed, and only after evening hours were added. That supports better access for teens, nothing stronger.',
  ),
  Question(
    id: 'inf3',
    category: 'Inferences',
    difficulty: Difficulty.hard,
    passage:
        'A botanist noted that an alpine moss thrived on a north-facing slope but was absent from a nearby south-facing slope, even though the soil composition on both slopes was identical.',
    prompt: 'Which finding does the botanist\'s observation best support?',
    options: [
      'Soil composition alone does not explain where the moss grows.',
      'The moss cannot grow on any slope.',
      'South-facing slopes always have more moss.',
      'Soil is irrelevant to all plant growth.',
    ],
    correctIndex: 0,
    explanation:
        'Identical soil but different moss presence means something other than soil matters. The other choices overgeneralize.',
  ),

  // ---------- Words in Context ----------
  Question(
    id: 'wic1',
    category: 'Words in Context',
    difficulty: Difficulty.easy,
    passage:
        'The mayor\'s response to the flood was ______, arriving within hours with supplies and repair crews.',
    prompt: 'Which choice completes the text with the most logical word?',
    options: ['prompt', 'hesitant', 'vague', 'reluctant'],
    correctIndex: 0,
    explanation:
        '"Within hours" signals speed, so "prompt" fits. The other words suggest delay or uncertainty.',
  ),
  Question(
    id: 'wic2',
    category: 'Words in Context',
    difficulty: Difficulty.medium,
    passage:
        'Although the novel\'s plot is fairly simple, its themes are ______, rewarding readers who look beyond the surface.',
    prompt: 'Which choice completes the text with the most logical word?',
    options: ['shallow', 'layered', 'accidental', 'obvious'],
    correctIndex: 1,
    explanation:
        '"Rewarding readers who look beyond the surface" requires themes with depth. "Layered" fits; "shallow" and "obvious" contradict it.',
  ),
  Question(
    id: 'wic3',
    category: 'Words in Context',
    difficulty: Difficulty.hard,
    passage:
        'Unlike the ______ prose of the opening chapters, which sprawled across page after page, the final chapter is spare and clipped.',
    prompt: 'Which choice completes the text with the most logical word?',
    options: ['terse', 'expansive', 'ambiguous', 'luminous'],
    correctIndex: 1,
    explanation:
        '"Unlike" sets up a contrast with "spare and clipped," and "sprawled" describes the opening. "Expansive" is the opposite of spare.',
  ),

  // ---------- Text Structure & Purpose ----------
  Question(
    id: 'tsp1',
    category: 'Text Structure & Purpose',
    difficulty: Difficulty.easy,
    passage:
        'Many people believe goldfish have a memory of only a few seconds. Experiments, however, show that goldfish can learn feeding schedules and remember them for months.',
    prompt: 'What is the main purpose of the text?',
    options: [
      'To challenge a popular misconception.',
      'To advise readers on goldfish care.',
      'To compare goldfish with other fish.',
      'To explain how experiments are designed.',
    ],
    correctIndex: 0,
    explanation:
        'The text states a common belief and then uses evidence to contradict it.',
  ),
  Question(
    id: 'tsp2',
    category: 'Text Structure & Purpose',
    difficulty: Difficulty.medium,
    passage:
        'Many historians credit the printing press with sparking the Scientific Revolution. Yet this account overlooks the role of translators, who made ancient texts readable to scholars long before mass printing arrived.',
    prompt: 'Which choice best describes the structure of the text?',
    options: [
      'It presents a widely held view, then introduces a complication.',
      'It lists several causes in order of importance.',
      'It describes a problem and proposes a solution.',
      'It summarizes two opposing studies.',
    ],
    correctIndex: 0,
    explanation:
        '"Yet" marks the turn from the common view to a factor that view overlooks.',
  ),

  // ---------- Cross-Text Connections ----------
  Question(
    id: 'ctc1',
    category: 'Cross-Text Connections',
    difficulty: Difficulty.medium,
    passage:
        'Text 1: Rooftop gardens cool cities by shading buildings and releasing moisture.\n\nText 2: Measurements show noticeable cooling only when gardens cover a large share of a district\'s roofs.',
    prompt:
        'How would the author of Text 2 most likely respond to the claim in Text 1?',
    options: [
      'By arguing that the cooling effect appears only at sufficient scale.',
      'By rejecting the claim entirely.',
      'By claiming rooftop gardens heat cities.',
      'By saying the claim has never been studied.',
    ],
    correctIndex: 0,
    explanation:
        'Text 2 accepts cooling but adds a condition, so it qualifies the claim rather than rejecting it.',
  ),

  // ---------- Central Ideas ----------
  Question(
    id: 'ci1',
    category: 'Central Ideas',
    difficulty: Difficulty.easy,
    passage:
        'Octopuses can unscrew jar lids, find their way through mazes, and even recognize individual human caretakers.',
    prompt: 'Which choice best states the main idea of the text?',
    options: [
      'Octopuses display notable intelligence.',
      'Octopuses are difficult to keep in captivity.',
      'Octopuses prefer human company.',
      'Octopuses are the largest sea animals.',
    ],
    correctIndex: 0,
    explanation:
        'Each example is a problem-solving or recognition skill, which together show intelligence.',
  ),

  // ---------- Command of Evidence ----------
  Question(
    id: 'coe1',
    category: 'Command of Evidence',
    difficulty: Difficulty.medium,
    passage:
        'A student claims that urban beekeeping benefits local plant diversity.',
    prompt:
        'Which finding, if true, would most directly support the student\'s claim?',
    options: [
      'Neighborhoods with hives had more flowering plant species than similar neighborhoods without hives.',
      'Honey sales in the city rose last year.',
      'Honeybees can travel up to three miles from a hive.',
      'Most beekeepers in the city are hobbyists.',
    ],
    correctIndex: 0,
    explanation:
        'Only the first choice compares plant diversity with and without hives, which is what the claim is about.',
  ),
  Question(
    id: 'coe2',
    category: 'Command of Evidence',
    difficulty: Difficulty.hard,
    passage:
        'A student claims that new bike lanes shortened commutes for cyclists but not for drivers.',
    prompt: 'Which finding would most directly support the claim?',
    options: [
      'Average cyclist commute fell by 6 minutes while the average driver commute was unchanged.',
      'The number of cyclists doubled after the lanes opened.',
      'Average driver commute fell by 6 minutes while cyclist commutes were unchanged.',
      'Both cyclist and driver commutes fell by about 6 minutes.',
    ],
    correctIndex: 0,
    explanation:
        'The claim has two parts: cyclists improved AND drivers did not. Only the first choice covers both.',
  ),
];

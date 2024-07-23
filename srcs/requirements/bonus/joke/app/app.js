const express = require('express');
const axios = require('axios');
const app = express();
const port = 3000;

const jokes = [
  {
    id: 1,
    setup: "Why don't scientists trust atoms?",
    punchline: "Because they make up everything!"
  },
  {
    id: 2,
    setup: "Why did the scarecrow win an award?",
    punchline: "He was outstanding in his field!"
  },
  {
    id: 3,
    setup: "Why don't eggs tell jokes?",
    punchline: "They'd crack each other up!"
  },
  {
    id: 4,
    setup: "What do you call a fake noodle?",
    punchline: "An impasta!"
  },
  {
    id: 5,
    setup: "Why did the math book look so sad?",
    punchline: "Because it had too many problems!"
  },
  {
    id: 6,
    setup: "What do you call a bear with no teeth?",
    punchline: "A gummy bear!"
  },
  {
    id: 7,
    setup: "What do you call a can opener that doesn't work?",
    punchline: "A can't opener!"
  },
  {
    id: 8,
    setup: "Why don't oysters donate to charity?",
    punchline: "Because they're shellfish!"
  },
  {
    id: 9,
    setup: "What do you call a cow with no legs?",
    punchline: "Ground beef!"
  },
  {
    id: 10,
    setup: "Why don't skeletons fight each other?",
    punchline: "They don't have the guts!"
  }
];

app.get('/', async (req, res) => {
  const randomNumber = Math.floor(Math.random() * 11);
  const joke = jokes[randomNumber];
  res.json({ joke: joke });
});

app.listen(port, () => {
  console.log(`Joke generator app listening at http://localhost:${port}`);
});
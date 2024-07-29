async function fetchJoke() {
    try {
        const response = await fetch('http://10.13.100.32:5000');
        const data = await response.json().then(data => data.joke);
        document.getElementById('setup').innerText = data.setup;
        document.getElementById('punchline').innerText = data.punchline;
    } catch (error) {
        document.getElementById('setup').innerText = 'Failed to fetch joke.';
    }
}

fetchJoke();

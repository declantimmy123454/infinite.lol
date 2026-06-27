import * as DiscordRPC from 'discord-rpc';

// Replace this string with your actual Client ID from the Discord Developer Portal
const clientId = '1516909789525966878'; 

const rpc = new DiscordRPC.Client({ transport: 'ipc' });

async function updatePresence() {
    rpc.setActivity({
        state: 'Modding with FCS MENU',
        details: 'Animal Company',
        startTimestamp: Math.floor(Date.now() / 1000), // Shows time elapsed starting from now
        largeImageKey: 'image_2026-06-17_171818495',
        largeImageText: 'FCS SKIDDED MENU',
        
        // Custom clickable button configuration
        buttons: [
            {
                label: 'Get the Menu', 
                url: 'https://discord.gg/jWENpPx3GF' // Replace with your actual link
            }
        ],
        instance: true,
    });
}

rpc.on('ready', () => {
    console.log('Discord Rich Presence Connected successfully!');
    updatePresence();
});

// Connect to Discord and catch any errors (like if Discord isn't open)
rpc.login({ clientId }).catch((err) => {
    console.error('Failed to connect to Discord RPC:', err.message);
});
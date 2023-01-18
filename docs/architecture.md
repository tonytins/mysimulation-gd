# Architecture

## Behavior Trees

<img src="./imgs/gdbehav-2021-03-13%20085615.png" style="float:left;padding:10px" width="200">

For anyone who has modded the classic Sims games, you might notice that it uses `BHAV` prefix, this stands for *behav*ior tree. Kagenashi's addon utilizes Godot's component-based pattern to provide the same functionility in Godot. If you've ever used FreeSO's modding tools, you'll notice the visual similarties.

In the classic games, both the objects and sims used `BHAV`. They both sent signals to each other, to use Godot terminology. If a Sim was hungry, they would use the nearest kitchen item that sent a signal their way. This is why pathfinding sucks. My Simulation aims to provide something similar while taking advantage of Godot's features.

## FreeSO

FreeSO's Volcanic is a good tool to understand how everything works. It replicates what Maxis used to use internally, at the time. Unfortunately, I cant recommend the project for proper research beyond that scope as their offical website, let alone Github, does not provide enough information or resources to help others understand the inner workings. Documentation is scarse, if nonexistent, beyond the Project Structure and Coding Standads, however it is the only thing we have for understanding the game.

I hate to be so blunt on a project I otherwise genuinely love. However, that's just the way it is, as far I'm concerned. Which is shame because it is our only reliable source of truth in understanding the inner workings of the classic games.

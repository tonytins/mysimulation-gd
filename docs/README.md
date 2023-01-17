# My Simulation

<p align="center">
<img src="./imgs/mysim-wordmark.svg">
<br>
<img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/tonytins/mysimulation/godot.yml"> <img alt="GitHub" src="https://img.shields.io/github/license/tonytins/mysimulation"> <img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/w/tonytins/mysimulation">
<hr>
</p>

My Simulation is a life simulation game inspired by The Sims, built using the Godot game engine. I've always been a huge fan of The Sims and always wanted to create my own life simulation game. I decided to use Godot as the game engine and use Kagenashi's behavior tree AI architecture to mimic the one used in The Sims to give the game a similar feel.

## Architecture

### Behavior Trees

<img src="./imgs/gdbehav-2021-03-13%20085615.png" style="float:left;padding:10px" width="200">

For anyone who has modded the old Sims games, you might notice that it uses ``BHAV``, this stands for behavior tree. If you've ever used FreeSO's visual modding tools, you'll notice that it uses a similar pattern. Kagenashi's addon is similar to this but utilizes Godot's component-based pattern.

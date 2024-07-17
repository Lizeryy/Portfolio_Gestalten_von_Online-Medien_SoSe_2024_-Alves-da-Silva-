# Portfolio_Gestalten_von_Online-Medien_SoSe_2024_-Alves-da-Silva-
Group project from Alicia Grimme, Melanie Birden, Maurice Michaeler and Anna Bisko

Cyber code (Alicia Grimme)
The algorithm:
This code creates a dynamic particle system using the Processing programming environment. It involves 500 particles that move around the screen, change colors, and connect with lines when they are close to each other. The loop initializes each particle with random values for position, speed, color properties, and size. The screen is cleared with a translucent black rectangle (fill (0, 0, 0, 20) and rect (0, 0, width, height)), which creates a fading trail effect. The particles bounce off the edges of the canvas by reversing their speed direction when they reach the boundaries and if a particle is within 100 pixels of the mouse cursor, its color properties are randomized.
Technology:
The whole code is programmed in Processing.
The end result:
The code is supposed to represent the synapses/ DNA structure with its aesthetic and also represents one of the human layers.
The amount of particels and the starting color are easy to change in the code by changing int numParticles = 500 to a smaller number and colorMode(HSB, 60, 100, 100, 100) to for example colorMode(HSB, 360, 100, 100, 100).

Soul Code (Melanie Birden)
The Soul code is an abstract representation of the human soul, the deepest layer of the body. To depict that, we have a colorful bunch of circles following the mouse cursor. The colorful spheres erupt into violet - blue colors and remind a bit of a round firework.

The code was made in Processing, a coding program specifically made for artistic outputs.

The algorithm itself is quite simple; we created a particle system that would spawn spheres at the mouseY and mouseX position on the screen. We defined parameters for the different aspects of the spheres (size, velocity,…). The spheres get spawned where the mouse cursor is and will errupt into a random direction at a random speed. To not have the screen cluttered with particles, there was a lifespan parameter included that both lets the spheres fade and disappear after x amount of time but also helps eliminate off - screen particles.

Bloodcell code (Anna Bisko)
The bloodcells code is inspired by the red bloodcells of the human body. The dents in the cells is implied by the different shades in each circle and to make it more visually interesting I added a gradient effect based on where the cell is located on the canvas and added the feature to move the mouse cursor around to give the repelling effect.

The Plattform used was Processing, a Plattform for creative output.

This code initializes an array of BloodCell objects, each with random positions, sizes, and velocities. In the draw function, it continuously updates the canvas by clearing it and iterating through each BloodCell, calling their move and display methods. The move method updates the cell's position based on its velocity and repels it from the mouse cursor if within a certain distance. It also wraps the cell around the edges of the canvas. The display method renders the cell with dynamically updated colors based on its position, creating gradient effects.

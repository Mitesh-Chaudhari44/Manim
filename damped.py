import pygame
from pygame.draw import circle

<<<<<<< HEAD
=======

>>>>>>> b8d4ca8cfacbaae35024e2a7e57ab031860ff554
pygame.init()
window_1 = pygame.display.set_mode((500, 500))
clock_bhai = pygame.time.Clock()
dt = 1
speed = pygame.Vector2(0, 0)  # Set initial speed to zero
player_pos = pygame.Vector2(window_1.get_width() / 2, window_1.get_height() / 2)
running = True
gravity = pygame.Vector2(0, 0.5)  # Gravity force
damping_factor = 0.99  # Damping factor to simulate damping effect
<<<<<<< HEAD
=======
col = ["red", "yellow", "green", "blue", "purple", "white"]
i = 0
>>>>>>> b8d4ca8cfacbaae35024e2a7e57ab031860ff554

while running:
    window_1.fill("black")

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Update speed by adding gravity and apply damping
    speed += gravity
    speed *= damping_factor

    # Update player position using the updated speed
    player_pos += speed * dt

    # Check for collision with window boundaries and reverse the speed if needed
    if player_pos.y < 20:
        player_pos.y = 20  # Set position to avoid getting stuck in boundary
<<<<<<< HEAD
        # speed.y *= -1 * damping_factor  # Reverse speed and apply damping
    elif player_pos.y > window_1.get_height() - 20:
        player_pos.y = window_1.get_height() - 20  # Set position to avoid getting stuck in boundary
        # speed.y *= -1 * damping_factor  # Reverse speed and apply damping

    # Draw the circle
    gola = pygame.draw.circle(window_1, "red", (int(player_pos.x), int(player_pos.y)), 20)
=======
        speed.y *= -1 * damping_factor  # Reverse speed and apply damping

    elif player_pos.y > window_1.get_height() - 20:
        player_pos.y = window_1.get_height() - 20  # Set position to avoid getting stuck in boundary
        speed.y *= -1 * damping_factor  # Reverse speed and apply damping
        i += 1
        if i == 6:
            i = 0
        if speed.length() == 0:  # Check if speed becomes zero
            col[i] = "white"  # Change color to white

    # Draw the circle
    gola = pygame.draw.circle(window_1, col[i], (int(player_pos.x), int(player_pos.y)), 20)
>>>>>>> b8d4ca8cfacbaae35024e2a7e57ab031860ff554

    pygame.display.flip()
    dt = clock_bhai.tick(60) / 60

pygame.quit()
<<<<<<< HEAD



=======
>>>>>>> b8d4ca8cfacbaae35024e2a7e57ab031860ff554

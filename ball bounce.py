from manim import *

class BouncingBall(Scene):
    def construct(self):
        # Create a ball
        ball = Circle(radius=0.5, color=BLUE, fill_opacity=1)

        # Set initial position and velocity
        ball.next_to(ORIGIN, UP)
        velocity = 1.5

        # Add ball to the scene
        self.add(ball)

        # Create animation
        self.play(
            ball.animate.shift(3 * DOWN).set_color(RED),  # Initial bounce
            rate_func=linear,
            run_time=1
        )

        # Simulate energy loss
        for _ in range(10):
            self.play(
                ball.animate.shift(3 * DOWN).set_color(RED),
                rate_func=linear,
                run_time=1
            )
            velocity *= 0.8  # Energy loss factor

        # Bounce with decreasing energy
        for _ in range(10):
            self.play(
                ball.animate.shift(velocity * DOWN),
                rate_func=linear,
                run_time=1
            )
            velocity *= 0.8  # Energy loss factor
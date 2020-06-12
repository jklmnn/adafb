#include <stdlib.h>
#include <SDL2/SDL.h>

static SDL_Window *window;
static SDL_Renderer *renderer;
static SDL_Texture *texture;
static void *data;

void initialize(unsigned width, unsigned height)
{
    SDL_Init(SDL_INIT_VIDEO);
    window = SDL_CreateWindow("AdaFB", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, width, height, 0);
    renderer = SDL_CreateRenderer(window, -1, 0);
    texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, width, height);
    data = malloc(width * height * 4);
    memset(data, 0, width * height * 4);
}

void *addr()
{
    return data;
}

void render(unsigned width)
{
    SDL_UpdateTexture(texture, 0, data, width * 4);
    SDL_RenderClear(renderer);
    SDL_RenderCopy(renderer, texture, 0, 0);
    SDL_RenderPresent(renderer);
}

void finalize()
{
    free(data);
    data = 0;
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

#pragma once


#ifdef MEINEBIBLIOTHEK_EXPORTS
#define MEINEBIBLIOTHEK_API __declspec(dllexport)
#else
#define MEINEBIBLIOTHEK_API __declspec(dllimport)
#endif

extern "C" MEINEBIBLIOTHEK_API void HalloWelt(); 
extern "C" MEINEBIBLIOTHEK_API void HalloWeltParameter(int x, int y, double radius);
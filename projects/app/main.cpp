#define WINAPI _stdcall
#define _In_ const

using HANDLE = void *;
using DWORD = unsigned int;
using LPDWORD = DWORD *;
using LPVOID = void *;
using BOOL = int;
using UINT = unsigned int;

extern "C"
{
    void WINAPI ExitProcess(UINT exitCode);

    BOOL WINAPI WriteConsoleW(HANDLE hConsoleOutput,
                              const void *lpBuffer,
                              DWORD nNumberOfCharsToWrite,
                              LPDWORD lpNumberOfCharsWritten,
                              LPVOID lpReserved);

    HANDLE WINAPI GetStdHandle(_In_ DWORD nStdHandle);
}

extern "C" void mainCRTstartup()
{
    HANDLE consoleOut = GetStdHandle((DWORD)-11);
    DWORD res;
    WriteConsoleW(consoleOut, u"Hello, world!\r\n\0", 15, &res, nullptr);
    ExitProcess(0);
}

#include <sys/types.h>
#include <stdio.h>
#include <sys/timeb.h>
#include <time.h>
#include "eif_eiffel.h"
#include "eif_threads.h"
#include "datetime.h"

#ifdef __cplusplus
	extern "C" {
#endif


#ifdef EIF_WIN32
#ifdef EIF_BORLAND
	struct timeb date_time_fine;
#else
	struct _timeb date_time_fine;
#endif
#else
	struct timeb date_time_fine;
#endif

#ifdef EIF_THREADS
	rt_private EIF_MUTEX_TYPE *mutex = NULL;
#endif

struct tm *date_time;
	
void c_get_date_time () 
{
	const time_t *tmp;
#ifdef EIF_THREADS
	if (!mutex)
		mutex = eif_thr_mutex_create();

	eif_thr_mutex_lock(mutex);
#endif
	
#ifdef EIF_WIN32
#ifdef EIF_BORLAND
	ftime (&date_time_fine);
#else
	_ftime (&date_time_fine);
#endif
#else
	ftime (&date_time_fine);
#endif
	date_time = localtime (&(date_time_fine).time);   
#ifdef EIF_THREADS
	eif_thr_mutex_unlock(mutex);
#endif
}

EIF_INTEGER c_year_now ()
{
	c_get_date_time ();
	return ((EIF_INTEGER)(1900 + date_time->tm_year));
}

EIF_INTEGER c_month_now ()
{
	c_get_date_time ();
	return ((EIF_INTEGER)(date_time->tm_mon) + 1);
}

EIF_INTEGER c_day_now ()
{
	c_get_date_time ();
	return ((EIF_INTEGER)(date_time->tm_mday));
}

EIF_INTEGER c_hour_now ()
{
	c_get_date_time ();
	return ((EIF_INTEGER)(date_time->tm_hour));
}

EIF_INTEGER c_minute_now ()
{
	c_get_date_time ();
	return ((EIF_INTEGER)(date_time->tm_min));
}
	
EIF_INTEGER c_second_now ()
{
	c_get_date_time ();
	return ((EIF_INTEGER)(date_time->tm_sec));
}

EIF_INTEGER c_millisecond_now ()
{
	int msec;
	
	c_get_date_time ();
	msec = date_time_fine.millitm;
#ifndef EIF_WIN32
	msec--;
#endif
	
	if (msec < 0 || msec > 999)
		msec = 0;

	return ((EIF_INTEGER)(msec));
}

EIF_INTEGER c_make_date (EIF_INTEGER d, EIF_INTEGER m, EIF_INTEGER y)
{
	int compact_date;
	compact_date = ((int) (d & 0xff) << 24);
	compact_date = compact_date | ((int) (m & 0xff) << 16);
	compact_date = compact_date | (y & 0xffff);
	return compact_date;
}

int normalize(int val, int size)
{
	int s = 1 << (size * 8);
	int res;

	if (val > s / 2)
		res = -(s - val);
	else
		res = val;

	return res;
}
EIF_INTEGER c_day (EIF_INTEGER compact_date)
{
	int res = normalize((compact_date & 0xff000000) >> 24, sizeof(char));
	return (EIF_INTEGER) res;
}

EIF_INTEGER c_month (EIF_INTEGER compact_date)
{
	int res = normalize((compact_date & 0x00ff0000) >> 16, sizeof(char));
	return (EIF_INTEGER) res;
}

EIF_INTEGER c_year (EIF_INTEGER compact_date)
{
	int res = normalize(compact_date & 0x0000ffff, sizeof(int));
	return (EIF_INTEGER) res;
}

EIF_INTEGER c_hour (EIF_INTEGER compact_time)
{
	int res = normalize((compact_time & 0xff0000) >> 16, sizeof(char));
	return (EIF_INTEGER) res;
}

EIF_INTEGER c_minute (EIF_INTEGER compact_time)
{
	int res = normalize((compact_time & 0x00ff00) >> 8, sizeof(char));
	return (EIF_INTEGER) res;
}

EIF_INTEGER c_second (EIF_INTEGER compact_time)
{
	int res = normalize(compact_time & 0x0000ff, sizeof(char));
	return (EIF_INTEGER) res;
}

void c_set_day (EIF_INTEGER d, EIF_INTEGER *compact_date)
{
	*compact_date = *compact_date & 0x00ffffff;
	*compact_date = *compact_date + ((int) (d << 24));
}

void c_set_month (EIF_INTEGER m, EIF_INTEGER *compact_date)
{
	*compact_date = *compact_date & 0xff00ffff;
	*compact_date = *compact_date + ((int) (m << 16));
}

void c_set_year (EIF_INTEGER y, EIF_INTEGER *compact_date)
{
	*compact_date = *compact_date & 0xffff0000;
	*compact_date = *compact_date + ((int) (y));
}

EIF_INTEGER c_make_time (EIF_INTEGER h, EIF_INTEGER m, EIF_INTEGER s)
{   int compact_time;
	compact_time = ((int) (h & 0xff) << 16);
	compact_time = compact_time | ((int) (m & 0xff) << 8);
	compact_time = compact_time | (s & 0xff);
	
	return compact_time;
}

void c_set_hour (EIF_INTEGER h, EIF_INTEGER *compact_time)
{
	*compact_time = *compact_time & 0x00ffff;
	*compact_time = *compact_time + ((int) (h << 16));
}

void c_set_minute (EIF_INTEGER m, EIF_INTEGER *compact_time)
{
	*compact_time = *compact_time & 0xff00ff;
	*compact_time = *compact_time + ((int) (m << 8));
}

void c_set_second (EIF_INTEGER s, EIF_INTEGER *compact_time)
{
	*compact_time = *compact_time & 0xffff00;
	*compact_time = *compact_time + ((int) (s));
}

#ifdef __cplusplus
	}
#endif

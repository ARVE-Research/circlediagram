program parsedata

implicit none

real :: pw_page  !plot width on the paper (cm)
real :: pw_m     !plot width in the plot scale (m)

! real :: scalef

integer :: level
integer :: cat
real    :: area

character(10) :: arg1
character(10) :: arg2

real,    allocatable, dimension(:,:) :: larea
integer, allocatable, dimension(:,:) :: lcat

integer :: element
integer :: prev
integer :: i,j

real :: r0
real :: a0
real :: a1
real :: afrac

integer :: nelem
real :: totarea

integer :: nlev
integer :: ncat

integer, dimension(1) :: n

! character(200) :: infile

!---

nlev = 6   ! number of levels
ncat = 5   ! maximum number of categories per level

allocate(larea(nlev,ncat))
allocate(lcat(nlev,ncat))

! call getarg(1,infile)
call getarg(1,arg1)
call getarg(2,arg2)

read(arg1,*)pw_page
read(arg2,*)pw_m

larea = 0.
lcat = 0
element = 1
prev = 0

do
  read(*,*,end=99)level,cat,area
  
  if (level == prev) then
    element = element + 1
  else
    element = 1
  end if

  if (element > ncat) stop 'too many categories; adjust ncat'

  prev = level

  larea(level,element) = area
  lcat(level,element) = cat
  
  ! write(0,*)level,element,cat,area

end do

99 continue

do i = level,1,-1
  
  !calculate radius of the circle for this level

  totarea = sum(larea(:i,:))

  r0 = radius(totarea)
  
  nelem = count(larea(i,:) > 0.)
  
  ! write(0,*)i,nelem

  if (nelem > 1) then !have to make wedges
    
    a0 = 270.
    
    do j = 1,ncat
    
      if (larea(i,j) == 0) cycle
      
      !calculate area fraction and then angle of wedge

      afrac = larea(i,j) / sum(larea(i,:))
      
      a1 = a0 + 360. * afrac
      
      write(*,'(3i5,3f10.4,a)')0,0,lcat(i,j),r0,a0,a1,' w'  !write the radius and the start and end angles
      
      a0 = a1
      
    end do
    
  else  !just write the circle diameter for the non-zero category
  
    n = maxloc(larea(i,:))
  
    write(*,'(3i5,f10.4,a)')0,0,lcat(i,n),r0,' c'

  end if
  
end do

!-----------------

contains

real function radius(area)

!return a radius (in page plot cm) on the basis of an area (in hectares) as input

implicit none
  
real, intent(in) :: area

real, parameter :: pi = 4. * atan (1.)

!---

radius = pw_page / pw_m * 200. * sqrt(area / pi)  !the 200 converts sqrt(ha) to m and radius to diameter
  
end function radius
  

end program parsedata

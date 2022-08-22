/*--------------------------------*- C++ -*----------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     | Website:  https://openfoam.org
    \\  /    A nd           | Version:  9
     \\/     M anipulation  |
\*---------------------------------------------------------------------------*/
FoamFile
{
    format      ascii;
    class       volScalarField;
    object      k;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#include        "include/initialConditions"

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform $turbulentKE;

boundaryField
{
    //- Set patchGroups for constraint patches
    #includeEtc "caseDicts/setConstraintTypes"

    inlet
    {
        type            freestream;
        freestreamValue $internalField;
        value           $internalField;
    }

    outlet
    {
        type            freestream;
        freestreamValue $internalField; //should be inletValue?
        value           $internalField;
    }

    plane
    {
        type            kqRWallFunction;
        value           uniform 1e-11;//$internalField;
    }

    #include "include/frontBackUpperPatches"
}


// ************************************************************************* //

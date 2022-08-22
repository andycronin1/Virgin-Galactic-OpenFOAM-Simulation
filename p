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
    object      p;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#include        "include/initialConditions"

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform $pressure;

boundaryField
{
    //- Set patchGroups for constraint patches
    #includeEtc "caseDicts/setConstraintTypes"

    inlet
    {
        type            freestreamPressure;
        freestreamValue uniform 0;
        value           uniform 0;
    }

    outlet
    {
        type            freestreamPressure;
        freestreamValue uniform 0;
        value           uniform 0;
    }

    plane
    {
        type            zeroGradient;
    }

    #include "include/frontBackUpperPatches"
}

// ************************************************************************* //

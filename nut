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
    location    "0";
    object      nut;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -1 0 0 0 0];

internalField   uniform 8.58e-06;

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
        freestreamValue $internalField;
        value           $internalField;
    }

    plane
    {
        type            nutkWallFunction;
        value           uniform 0;
    }

    #include "include/frontBackUpperPatches"


}


// ************************************************************************* //

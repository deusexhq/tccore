# TCCore

A collection of code and random stuff to use as a core for my other mods in Deus Ex.
Includes useful code snippets in CodeBase. A useful way to access them in other mods is; Have this mod above yours in EditActors, and call them with:

function CodeBase _CodeBase()
{
	return Spawn(class'CodeBase');
}

and then _CodeBase().Function() in your file.

For auto-updating to make sure you have the latest files, add ServerActors=TCCore.TCCore
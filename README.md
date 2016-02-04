# foveas3-modding-engine

This is the core of a generic modding engine for AS3 projects.

### Data Structures

#### ModdableParameter

Customizable game parameter (appearance of rule).

Example of moddable parameters:

 * *Image for the tile background*
 * *Color of text on tiles*
 * *Image for the game background*

A moddable parameter has:

 * `id:String`
 * `localizableTitle`
 * `localizableDescription`

#### ModdableValue

Value that can be associated to a `Moddable`.

 * `id:String`
 * `localizableTitle`
 * `localizableDescription`
 * `value:JSON`

#### Mod

Define values of customizable parts of a game.

It's a map `parameterId ⇒ valueId`.

**Tags**: *StateLess*, *JSON*

Can be easily converted from/to JSON, for inclusion in game parameters:
  * `fromJSON(obj:Object)`
  * `toJSON():Object`

### Actors

#### ParameterModder

Will apply a moddable parameter to a game.

 * `.apply(value, game...)`

#### Modder

 * Save and load mod parameters to/from game's data.
 * Apply a Mod to the game's display elements and rules.
   * Do so by calling the `ParameterModders` associated with a mod.

#### DefaultMod

Remember the player's customization preferences (across devices).

Backed with an `IModStorage`.
 
#### IModStorage

 * `.load:: (Err → Mod → Void) → Void`
 * `.save:: Mod → (Err → Void) → Void`

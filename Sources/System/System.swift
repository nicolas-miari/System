import Foundation
import Component

/**
 Common interface to all systems.

 Extends AnyObject because a system does not make much sense as a value type.
 */
public protocol System: AnyObject {

  // Normally use Int or String. Int should be faster to compare. The identifier type only needs to
  // be equatable, not comparable. We only care whether two ids are equal or not, not which one
  // comes first
  associatedtype Identifier: Equatable

  // MARK: - Operation

  // Conforming types must implement based around private cache storage.
  func cacheEntity(id: Identifier, components: ComponentSet)

  // Conforming types must implement based around private cache storage.
  func uncacheEntity(id: Identifier)

  // Conforming types must implement based on custom sytem logic.
  func operateOnCachedEntities()

  // Conforming types must implement based on custom component requirements.
  func canOperateOnEntity(id: Identifier, components: ComponentSet) -> Bool
}

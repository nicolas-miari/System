import Foundation
import Component
import Entity

/**
 Common interface to all systems.

 Extends AnyObject because a system does not make much sense as a value type.
 */
public protocol System: AnyObject {

  // MARK: - Operation

  // Conforming types must implement based around private cache storage.
  func cacheEntity(id: EntityIdentifier, components: ComponentSet)

  // Default implementation is provided based around `cacheEntity(id:components:)`.
  func cacheEntities(_ table: [EntityIdentifier: ComponentSet])

  // Conforming types must implement based around private cache storage.
  func uncacheEntity(id: EntityIdentifier)

  // Conforming types must implement based on custom sytem logic.
  func operateOnCachedEntities()

  // Conforming types must implement based on custom component requirements.
  func canOperateOnEntity(id: EntityIdentifier, components: ComponentSet) -> Bool
}

// MARK: - Default Implementations

extension System {
  public func cacheEntities(_ table: [EntityIdentifier: ComponentSet]) {
    table.forEach { id, components in
      self.cacheEntity(id: id, components: components)
    }
  }
}

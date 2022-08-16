/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

// MARK: - Physics system management
public extension Physac {
    /// Initializes physics system
    @inlinable
    static func initPhysics() {
        _RaylibC.InitPhysics()
    }
    
    ///Update physics system
    @inlinable
    static func updatePhysics() {
        _RaylibC.UpdatePhysics()
    }
    
    /// Reset physics system
    @inlinable
    static func resetPhysics() {
        _RaylibC.ResetPhysics()
    }
    
    /// Close physics system and unload used memory
    @inlinable
    static func closePhysics() {
        _RaylibC.ClosePhysics()
    }
    
    /// Sets physics fixed time step in milliseconds. 1.666666 by default
    @inlinable
    static func setPhysicsTimeStep(_ delta: Double) {
        _RaylibC.SetPhysicsTimeStep(delta)
    }
    
    /// Sets physics global gravity force
    @inlinable
    static func setPhysicsGravity(_ x: Float, _ y: Float) {
        _RaylibC.SetPhysicsGravity(x, y)
    }
}

// MARK: - Physic body creation/destroy
public extension Physac {
    /// Creates a new circle physics body with generic parameters
    @inlinable
    static func createPhysicsBodyCircle(_ pos: Vector2, _ radius: Float, _ density: Float) -> PhysicsBody {
        return _RaylibC.CreatePhysicsBodyCircle(pos, radius, density)
    }
    
    /// Creates a new rectangle physics body with generic parameters
    @inlinable
    static func createPhysicsBodyRectangle(_ pos: Vector2, _ width: Float, _ height: Float, _ density: Float) -> PhysicsBody {
        return _RaylibC.CreatePhysicsBodyRectangle(pos, width, height, density)
    }
    
    /// Creates a new polygon physics body with generic parameters
    @inlinable
    static func createPhysicsBodyPolygon(_ pos: Vector2, _ radius: Float, _ sides: Int32, _ density: Float) -> PhysicsBody {
        return _RaylibC.CreatePhysicsBodyPolygon(pos, radius, sides, density)
    }
    
    /// Destroy a physics body
    @inlinable
    static func destroyPhysicsBody(_ body: PhysicsBody) {
        _RaylibC.DestroyPhysicsBody(body)
    }
}

// MARK: - Physic body forces
public extension Physac {
    ///  Adds a force to a physics body
    @inlinable
    static func physicsAddForce(_ body: PhysicsBody, _ force: Vector2) {
        _RaylibC.PhysicsAddForce(body, force)
    }
    
    ///  Adds an angular force to a physics body
    @inlinable
    static func physicsAddTorque(_ body: PhysicsBody, _ amount: Float) {
        _RaylibC.PhysicsAddTorque(body, amount)
    }
    
    /// Shatters a polygon shape physics body to little physics bodies with explosion force
    @inlinable
    static func physicsShatter(_ body: PhysicsBody, _ position: Vector2, _ force: Float) {
        _RaylibC.PhysicsShatter(body, position, force)
    }
    
    /// Sets physics body shape transform based on radians parameter
    @inlinable
    static func setPhysicsBodyRotation(_ body: PhysicsBody, _ radians: Float) {
        _RaylibC.SetPhysicsBodyRotation(body, radians)
    }
}

// MARK: - Query physics info
public extension Physac {
    /// Returns a physics body of the bodies pool at a specific index
    @inlinable
    static func getPhysicsBody(_ index: Int32) -> PhysicsBody {
        return _RaylibC.GetPhysicsBody(index)
    }
    
    /// Returns the current amount of created physics bodies
    @inlinable
    static func getPhysicsBodiesCount() -> Int32 {
        return _RaylibC.GetPhysicsBodiesCount()
    }
    
    /// Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)
    @inlinable
    static func getPhysicsShapeType(_ index: Int32) -> PhysicsShapeType {
        return PhysicsShapeType(rawValue: _RaylibC.GetPhysicsShapeType(index))!
    }
    
    /// Returns the amount of vertices of a physics body shape
    @inlinable
    static func getPhysicsShapeVerticesCont(_ index: Int32) -> Int32 {
        return _RaylibC.GetPhysicsShapeVerticesCount(index)
    }
    
    @inlinable
    static func getPhysicsShapeVertex(_ body: PhysicsBody, _ vertex: Int32) -> Vector2 {
        return _RaylibC.GetPhysicsShapeVertex(body, vertex)
    }
}

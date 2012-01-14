<?php


/**
 * This class represents a Role in the Lion RBAC.
 * 
 * @see __RoleManager
 * 
 */
class __Role {

    /**
     * An unike identifier for current role
     *
     * @var string
     */
    protected $_id = null;
    
    /**
     * Permissions associated directly to the current role. 
     * However, a role inherits all permissions from his junior roles
     *
     * @var array
     */
    protected $_permissions = array();
    
    /**
     * This is the binary representation of all permissions that belong to current role (included
     * permissions inherited by junior roles)
     *
     * @var integer
     */
    protected $_equivalent_permission = null;
    
    /**
     * This variable stores all {@link __Role} instances that are directly junior roles for current role (only 1 depth level, because each junior role can have his own junior roles at the same time).
     *
     * @var array
     */
    protected $_junior_roles = array();
    
    /**
     * This is the constructor method.
     * An identifier is required to build a new {@link __Role} instance
     *
     * @param string $id An identifier for current {@link __Role}
     */
    public function __construct($id) {
        $this->_id = strtoupper($id);
        $this->_recalculateEquivalentPermission();
    }

    /**
     * This method returns the current role identifier.
     *
     * @return string The role identifier
     */
    public function getId() {
        return $this->_id;
    }
    
    /**
     * Add a new junior role to the current one.
     *
     * @param __Role $junior_role The role to set as junior role
     */
    public function addJuniorRole(__Role &$junior_role) {
        $this->_junior_roles[$junior_role->getId()] =& $junior_role;
        $this->_recalculateEquivalentPermission();
    }
    
    /**
     * This method returns all junior roles that has been set with the {@link addJuniorRole} method
     *
     * @return array
     */
    public function &getJuniorRoles() {
        return $this->_junior_roles;
    }    

    private function _recalculateEquivalentPermission() {
        $this->_equivalent_permission = new __Permission('EQUIVALENT_PERMISSION_FOR_' . $this->getId(), 0);
        foreach($this->_permissions as &$permission) {
            $this->_equivalent_permission->addJuniorPermission($permission);
        }
        foreach($this->_junior_roles as &$junior_role) {
            $equivalent_permission = $junior_role->getEquivalentPermission();
            $this->_equivalent_permission->addJuniorPermission($equivalent_permission);
            unset($equivalent_permission);
        }
    }

    /**
     * Get an equivalent {@link __Permission} instance containing all the permissions
     * that belong to current instances plus all his junior roles.
     *
     * @return __Permission
     */
    public function &getEquivalentPermission() {
        return $this->_equivalent_permission;
    }
    
    /**
     * This method add a {@link __Permission} instance to current role.
     *
     * @param __Permission $permission The permission to add to the current role
     */
    public function addPermission(__Permission &$permission) {
        $this->_permissions[$permission->getId()] =& $permission;
        $this->_recalculateEquivalentPermission();
    }
    
}
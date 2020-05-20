/*package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.online.booking.entities.Account;

@Repository("accountRepository")
public interface AccountRepository extends  CrudRepository<Account,Integer>{
	
}
*/

package com.booking.repositories;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.entities.Account;
import com.booking.entities.UserGroup;

@Repository
public interface AccountRepository extends  CrudRepository<Account,Integer>{

}

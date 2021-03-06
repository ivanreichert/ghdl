
-- Copyright (C) 2001 Bill Billowitch.

-- Some of the work to develop this test suite was done with Air Force
-- support.  The Air Force and Bill Billowitch assume no
-- responsibilities for this software.

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

-- ---------------------------------------------------------------------
--
-- $Id: tc1025.vhd,v 1.2 2001-10-26 16:30:05 paw Exp $
-- $Revision: 1.2 $
--
-- ---------------------------------------------------------------------

ENTITY c06s03b00x00p10n02i01025ent IS
END c06s03b00x00p10n02i01025ent;

ARCHITECTURE c06s03b00x00p10n02i01025arch OF c06s03b00x00p10n02i01025ent IS

BEGIN
  B1 : block
    constant C : integer := 10;
  begin
    B2 : block
      constant C : integer := B1.c; -- Ok
    begin
      process
      begin
        null;
      end process;
    end block;
    B3 : block
      constant C : integer := B1.c; -- Ok
      constant Bad_C : integer := B2.c;
      -- Error : Initialization Expression is not visible.
    begin
      process
      begin
        null;
      end process;
    end block;
  end block;

  TESTING: PROCESS
  BEGIN
    assert FALSE 
      report "***FAILED TEST: c06s03b00x00p10n02i01025 - Expanded name visible only in the construct." 
      severity ERROR;
    wait;
  END PROCESS TESTING;

END c06s03b00x00p10n02i01025arch;

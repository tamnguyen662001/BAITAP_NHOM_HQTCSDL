using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
    public class LoadTableDAO
    {
        public static int width = 100;
        public static int heigh = 100;
        private static LoadTableDAO instance;

        public static LoadTableDAO Instance 
        {
            get  {if (instance == null) instance = new LoadTableDAO() ; return LoadTableDAO.instance; }
            private set { LoadTableDAO.instance = value; }
        }
        private LoadTableDAO() { }

        public List<TableDTO> loadListTable()
        {
            List<TableDTO> tablelist = new List<TableDTO>();

            DataTable data = DataProvider.Instance.ExecuteQuery("EXEC DSBAN");
            
            foreach (DataRow item in data.Rows)
            {
                TableDTO table = new TableDTO(item);
                tablelist.Add(table);
            }

            return tablelist;
        }
    }
}

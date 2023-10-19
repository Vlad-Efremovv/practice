using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ooobject
{
    /// <summary>
    /// Логика взаимодействия для MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        public MenuPage()
        {
            InitializeComponent();
                    }

        private void signUp_Click(object sender, RoutedEventArgs e)
        {
            MenuFrame.Navigate(new SignUpNewPage());
        }

        private void delete_Click(object sender, RoutedEventArgs e)
        {

        }

        private void sihgnUpCollaborator_Click(object sender, RoutedEventArgs e)
        {

        }

        private void viewEquipment_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

class CreateExampleAppDesktopApplication
  def self.up
    app = DesktopApplication.create(
      :description => 'Desktop App Demo',
      :icon => 'icon-monitor',
      :javascript_class_name => 'Compass.ErpApp.Desktop.Applications.ExampleApp',
      :internal_identifier => 'example_app',
      :shortcut_id => 'example_app-win'
    )
    pt1 = PreferenceType.iid('desktop_shortcut')
    pt1.preferenced_records << app
    pt1.save

    pt2 = PreferenceType.iid('autoload_application')
    pt2.preferenced_records << app
    pt2.save
  end

  def self.down
    DesktopApplication.destroy_all(['internal_identifier = ?','example_app'])
  end
end

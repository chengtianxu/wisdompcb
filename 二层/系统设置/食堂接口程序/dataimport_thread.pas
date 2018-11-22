unit dataimport_thread;

interface

uses
  Classes;

type
  TMyThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses UDM, MainU, modify_card,StrUtils;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMyThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TMyThread }

procedure TMyThread.Execute;
begin
dm.ADOGETDATA.SQL.Clear;
dm.ADOGETDATA.SQL.Text:='exec update_card_list_'+leftstr(main_form.ComboBox1.Text,2);
dm.ADOGETDATA.ExecSQL;
mainu.Main_Form.ProgressBar_importdata.Position:=100;
mainu.Main_Form.button_dr.Enabled:=true;
mainu.Main_Form.button_cj.Enabled:=true; 
end;

end.



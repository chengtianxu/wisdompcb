unit part_quantity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids, Menus,ComObj, Excel2000,ClipBrd,
  Buttons;

type
  TForm4 = class(TForm)
    Aq53: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Aq53PROD_CODE: TStringField;
    Aq53CUST_CODE: TStringField;
    Aq53quantity_hand: TFloatField;
    Aq53amount: TFloatField;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Aq53so_mianji: TFloatField;
    Aq53MANU_PART_NUMBER: TStringField;
    Aq53MANU_PART_DESC: TStringField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Aq53cust_code10: TStringField;
    Aq53TTYPE: TStringField;
    Aq53ORIG_CUSTOMER: TStringField;
    Aq53ANALYSIS_CODE_2: TStringField;
    Aq53SAMPLE_NR: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses main, partin_report,common;
{$R *.dfm}
procedure TForm4.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aq53.SQL.Text);
end;

procedure TForm4.N1Click(Sender: TObject);
begin
 aq53.Close;
 aq53.SQL.Delete(aq53.SQL.Count-1);
 aq53.SQL.Add('order by data0050.customer_part_number');
 aq53.Open;
 n1.Checked := true;
 n2.Checked := false;
 n3.Checked := false;
end;

procedure TForm4.N2Click(Sender: TObject);
begin
 aq53.Close;
 aq53.SQL.Delete(aq53.SQL.Count-1);
 aq53.SQL.Add('order by data0008.prod_code');
 aq53.Open;
 n1.Checked := false;
 n2.Checked := true;
 n3.Checked := false;
end;

procedure TForm4.N3Click(Sender: TObject);
begin
 aq53.Close;
 aq53.SQL.Delete(aq53.SQL.Count-1);
 aq53.SQL.Add('order by data0010.abbr_name');
 aq53.Open;
 n1.Checked := false;
 n2.Checked := false;
 n3.Checked := true;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then  //权限
  begin
   form_report.ppdbtext7.Visible:=false;

   form4.DBGrid1.Columns[7].Visible:=false;
  end;
 aq53.DisableControls;

 Form_report.ppReport1.Reset;
 Form_report.ppReport1.Template.FileName:=
    StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'custpart_lucre.rtm';
 Form_report.ppReport1.Template.LoadFromFile;
 Form_report.ppReport1.SaveAsTemplate:=False;

 form_report.ppReport1.Print;
 aq53.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm4.Button2Click(Sender: TObject);

 begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption);
  end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Aq53.Filter := field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  Aq53.Filter := '';
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 self.field_name:='MANU_PART_NUMBER';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>'quantity_hand') and
    (column.FieldName<>'amount') and
    (column.FieldName<>'mianji') and
    (column.FieldName<>'so_mianji') and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  with aq53 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;
 end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  self.DBGrid1TitleClick(self.DBGrid1.Columns.Items[1]);
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
 try
   Form_report:=TForm_report.Create(Application);
   Form_report.ppReport1.Reset;
   Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'custpart_lucre.rtm';
   Form_report.ppReport1.Template.LoadFromFile;
   Form_report.ppReport1.SaveAsTemplate:=True;
   Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then  //权限
  begin
   form_report.ppdbtext7.Visible:=false;

   form4.DBGrid1.Columns[7].Visible:=false;
  end;
 aq53.DisableControls;

 Form_report.ppReport1.Reset;
 Form_report.ppReport1.Template.FileName:=
    StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'custpart_lucre.rtm';
 Form_report.ppReport1.Template.LoadFromFile;
 Form_report.ppReport1.SaveAsTemplate:=False;

 form_report.ppReport1.Print;
 aq53.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
 try
   Form_report:=TForm_report.Create(Application);
   Form_report.ppReport1.Reset;
   Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'custpart_lucre.rtm';
   Form_report.ppReport1.Template.LoadFromFile;
   Form_report.ppReport1.SaveAsTemplate:=True;
   Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

end.

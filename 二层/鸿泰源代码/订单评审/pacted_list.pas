unit pacted_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBGrid3: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses damo;

{$R *.dfm}
procedure TForm6.NewGridWnd(var Message: TMessage);
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

procedure TForm6.FormActivate(Sender: TObject);
begin
with dm.AQ9711 do
 begin
  close;
  dm.AQ9711.Parameters[0].Value:=dm.ado60_cancelrkey97.Value;
  active:=true;
  if not isempty then memo1.Text:=dm.AQ9711memo_text.Value;
 end;

  with dm.ADOQuery1 do                     //查找加工指示
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select rkey,remark,eng_note from data0025');
    sql.Add('where PARENT_PTR=0 and');
    sql.add('ANCESTOR_PTR='+dm.ado60_cancelCUST_PART_PTR.AsString);
    active := true;
    memo3.Text:=fieldbyname('remark').AsString;  //指示
    MEMO2.Text:=fieldbyname('eng_note').AsString;  //备注
   end;
   
  with dm.ADOQuery1 do                     //查找销售定单记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=60 and');
    sql.add('file_pointer='+dm.ado60_cancelrkey60.AsString);
    active := true;
    if not isempty then  memo4.Text:= Fieldbyname('memo_text').AsString;
   end;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

end.

unit logininformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm_logininformation = class(TForm)
    DBGrid1: TDBGrid;
    ADS173: TADODataSet;
    DataSource1: TDataSource;
    Button3: TButton;
    ADS173compute_name: TStringField;
    ADS173network_ip: TStringField;
    ADS173login_date: TDateTimeField;
    ADS173type: TBooleanField;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_logininformation: TForm_logininformation;

implementation

uses damo,common;

{$R *.dfm}

procedure TForm_logininformation.FormActivate(Sender: TObject);
begin
self.ADS173.Open;
end;

procedure TForm_logininformation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
self.ADS173.Close;
end;

procedure TForm_logininformation.Button1Click(Sender: TObject);
begin
if not self.ADS173.IsEmpty then
begin
 self.ADS173.Delete;
 ShowMessage('删除操作成功!');
end
else
 ShowMessage('已没有可删除的登入日志!');
end;

procedure TForm_logininformation.Button2Click(Sender: TObject);
begin
with dm.adsTmp do
 begin
    close;
    sql.Text:='delete DATA0173'+#13+
             'where  csi_ptr='+rkey73;
   if ExecSQL>0 then
   ShowMessage('删除操作成功!');
 end;
Self.ADS173.Close;
self.ADS173.Open;
end;

procedure TForm_logininformation.NewGridWnd(var Message: TMessage);
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

procedure TForm_logininformation.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

end.

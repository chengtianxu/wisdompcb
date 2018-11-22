unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DB, ADODB, DBGrids;

type
  TFrmMain = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn7: TBitBtn;
    ADOData0075: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses EditItems, AddItems,common;

{$R *.dfm}

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAddItems, FrmAddItems);
  FrmAddItems.showmodal;
  FrmAddItems.free;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
  if messagedlg('确认要删除该杂项物品类别吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  TRY
    ADOData0075.Delete ;
  except
    messagedlg('该类别不能使用，不能删除！',mtinformation,[mbOk],0);
  end;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmEditItems, FrmEditItems);
  FrmEditItems.edit1.Text :=trim(ADOData0075.fieldbyname('Description').asstring);
  FrmEditItems.showmodal;
  FrmEditItems.free;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  if Adoconnection1.Connected  then
  ADOData0075.Open ;
end;

procedure TFrmMain.FormCreate(Sender: TObject);

begin
if not app_init(self.ADOConnection1) then
 begin
  showmsg('程序起动失败请联系管理员!',1);
  application.Terminate;
 end;
self.Caption:=application.Title;
end;

end.

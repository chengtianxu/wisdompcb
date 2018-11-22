unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ActnList, ImgList;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N01: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N03: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N04: TMenuItem;
    N6: TMenuItem;
    N05: TMenuItem;
    N7: TMenuItem;
    N06: TMenuItem;
    N8: TMenuItem;
    N07: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N99: TMenuItem;
    adoConn: TADOConnection;
    N08: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N_Separate1: TMenuItem;
    N13: TMenuItem;
    N_Separate0: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N99Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    iTag: Integer;    
  end;

var
  frmMain: TfrmMain;

implementation

uses BaseForm,
     Report1,      {出库明细查询}
     Report2,      {出库汇总查询}
     Report3,      {入库明细查询}
     Report4,      {库存明细查询}
     Report5,      {库存汇总查询}
     Report6,      {在途明细查询}
     Report7,      {供应商信息查询}
     Report8,      {材料信息查询}
     Report9,      {生产物料请购查询}
     Report10,     {非生产物料请购查询}
     Report11,     {生产物料采购查询(准时交付率)}
     Report12,     {非生产物料采购查询(准时交付率)}
     Report13,     {Cost Down 信息查询}
     common;

{$R *.dfm}

procedure TfrmMain.N1Click(Sender: TObject);
var
  vTitle,vSql,vFormName,vClassName: string;
begin
  Case (Sender as TMenuItem).Tag of
    1:
    begin
      vTitle:= '出库明细查询';
      //vSql:= 'Exec SP_GroupReports :Servers, :Condition, :OrderBy';
    end;
    2:
    begin
      vTitle:= '出库汇总查询';
      //vSql:= 'Exec SP_GroupReports;2 :Servers, :Condition, :OrderBy';   //使用带分号的存储过程会导致Parameters类型出错,必须先设定好Parameters才能使用
    end;
    3:
    begin
      vTitle:= '入库明细查询';
      //vSql:= 'Exec SP_GroupReports;3 :Servers, :Condition, :OrderBy';
    end;
    4:
    begin
      vTitle:= '库存明细查询';
      //vSql:= 'Exec SP_GroupReports;4 :Servers, :Condition, :OrderBy';
    end;
    5:
    begin
      vTitle:= '库存汇总查询';
      //vSql:= 'Exec SP_GroupReports;5 :Servers, :Condition, :OrderBy';
    end;
    6:
    begin
      vTitle:= '在途明细查询';
      //vSql:= 'Exec SP_GroupReports;6 :Servers, :Condition, :OrderBy';
    end;
    7:
    begin
      vTitle:= '供应商信息查询';
      //vSql:= 'Exec SP_GroupReports;7 :Servers, :Condition, :OrderBy';
    end;
    8:
    begin
      vTitle:= '材料信息查询';
      //vSql:= 'Exec SP_GroupReports;8 :Servers, :Condition, :OrderBy';
    end;
    9:
    begin
      vTitle:= '生产物料请购查询';
      //vSql:= 'Exec SP_GroupReports;9 :Servers, :Condition, :OrderBy';
    end;
    10:
    begin
      vTitle:= '非生产物料请购查询';
      //vSql:= 'Exec SP_GroupReports;10 :Servers, :Condition, :OrderBy';
    end;
    11:
    begin
      vTitle:= '生产物料采购查询(准时交付率)';
      //vSql:= 'Exec SP_GroupReports;11 :Servers, :Condition, :OrderBy';
    end;
    12:
    begin
      vTitle:= '非生产物料采购查询(准时交付率)';
      //vSql:= 'Exec SP_GroupReports;12 :Servers, :Condition, :OrderBy';
    end;
    13:
    begin
      vTitle:= 'Cost Down 信息查询';
      //vSql:= 'Exec SP_GroupReports;13 :Servers, :Condition, :OrderBy';
    end;
  end;
  iTag:= (Sender as TMenuItem).Tag;
  vFormName:= 'frmReport'+IntToStr((Sender as TMenuItem).Tag);
  vClassName:= 'T'+vFormName;
  if Application.FindComponent(vFormName)=nil then
  begin
    if GetClass(vClassName) <> nil then
    with TfrmBaseForm(TComponentClass(FindClass(vClassName)).Create(Application)) do
    begin
      Name:= vFormName;
      InitForm(vTitle, vSql);
    end
    else
      ShowMessage(Format('类%s未注册',[vClassName]));
  end
  else
    TfrmBaseForm(Application.FindComponent(vFormName)).WindowState:= wsMaximized;
end;

procedure TfrmMain.N99Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{$IFDEF Release}
  if not App_init_2(adoConn) then
  begin
    ShowMsg('程序启动失败，请联系管理员！',1);
    Application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  adoConn.Connected:= False;
  adoConn.Connected:= True;
{$ENDIF}
  Self.Caption:= Application.Title;
end;

initialization

RegisterClasses([TfrmReport1,TfrmReport2,TfrmReport3,TfrmReport4,TfrmReport5,TfrmReport6,TfrmReport7,
                 TfrmReport8,TfrmReport9,TfrmReport10,TfrmReport11,TfrmReport12,TfrmReport13]);

finalization

UnRegisterClasses([TfrmReport1,TfrmReport2,TfrmReport3,TfrmReport4,TfrmReport5,TfrmReport6,TfrmReport7,
                   TfrmReport8,TfrmReport9,TfrmReport10,TfrmReport11,TfrmReport12,TfrmReport13]);

end.

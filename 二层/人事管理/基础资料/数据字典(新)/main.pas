unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls,DB, Menus;

type
  Tfrm_main = class(TForm)
    pnl1: TPanel;
    lblColumn: TLabel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grd1: TDBGridEh;
    TabSheet2: TTabSheet;
    Grd2: TDBGridEh;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label2: TLabel;
    PopupMenu2: TPopupMenu;
    procedure PageControl1Change(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd2TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   

  private
    { Private declarations }
    field_name:string;
    precolumn1:Tcolumneh;
    precolumn2:Tcolumneh;
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo,common, budget;

{$R *.dfm}

procedure Tfrm_main.PageControl1Change(Sender: TObject);
begin
  if PageControl1.TabIndex=1 then
  begin
    DM.ADODetail.Close;
    DM.ADODetail.Parameters[0].Value:=DM.ADODictrkey.Value;
    DM.ADODetail.Open;

    if dm.ADODictrkey.AsInteger = 1 then
    begin
     grd2.Columns[2].Title.Caption := '培训关联';
     grd2.Columns[3].Title.Caption := '合同预提示月数';
     grd2.Columns[4].Title.Caption:= '合同最大份数';
     grd2.Columns[2].Visible := true;
     grd2.Columns[3].Visible := true;
     grd2.Columns[4].Visible := true;
    end
    else
    begin
     grd2.Columns[2].Visible := false;
     grd2.Columns[3].Visible := false;
     grd2.Columns[4].Visible := false;
    end;
  end;
   if pagecontrol1.ActivePage.TabIndex = 0 then
    begin
      field_name := grd1.Columns[0].FieldName;
      PreColumn1:= grd1.Columns[0];
      label1.Caption :=grd1.Columns[0].Title.Caption ;
      edit1.Text := '';
      grd1.Columns[0].Title.Color := clred ;
    end;
  if pagecontrol1.ActivePage.TabIndex = 1 then
    begin
      field_name := grd2.Columns[0].FieldName;
      PreColumn2 := grd2.Columns[0];
      label1.Caption :=grd2.Columns[0].Title.Caption ;
      edit1.Text := '';
    end;
    label1.Visible:=pagecontrol1.TabIndex=0;
    label2.Visible:=pagecontrol1.TabIndex=1;
end;
procedure Tfrm_main.btnExitClick(Sender: TObject);
begin
Close;
application.Terminate;
end;

procedure Tfrm_main.btnRefreshClick(Sender: TObject);
var
 rkey2:integer;
begin
  rkey2:=dm.ADODetailrkey.Value;
  dm.ADODetail.Close;
  dm.ADODetail.Prepared;
  dm.ADODetail.Open;
  if rkey2>0 then
   dm.ADODetail.Locate('rkey',rkey2,[]);
end;

procedure Tfrm_main.btnExportClick(Sender: TObject);
begin
 case     PageControl1.ActivePageIndex of
  0:  begin
        common.Export_dbGridEH_to_Excel(Grd1,'数据类别');
      end;
  1:  begin
        common.Export_dbGridEH_to_Excel(Grd2,'类别明细');
      end;
 end;
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  case pagecontrol1.TabIndex of
  0:if trim(edit1.Text)<>'' then
     begin
       dm.ADODict.Filter:=precolumn1.FieldName+' like ''%'+trim(edit1.Text)+'%''';
     end
    else
     begin
      dm.ADODict.Filter:='';
     end;

  1:if trim(edit1.Text)<>'' then
      begin
        dm.ADODetail.Filter:=precolumn2.FieldName+' like ''%'+trim(edit1.Text)+'%''';
      end
    else
    begin
     dm.ADODetail.Filter:='';
    end;
  end;
end;
procedure Tfrm_main.Grd2TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ADODetail.IndexFieldNames:=column.FieldName+' DESC';
  end
 else
  begin
    column.Title.SortMarker:=smupeh;
    dm.ADODetail.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn2.FieldName<>column.FieldName) then
  begin
    label2.Caption:=column.Title.Caption;
    precolumn2.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn2:=column;
    Edit1.Text:='';
  end;
    Edit1.SetFocus;
end;

procedure Tfrm_main.N1Click(Sender: TObject);
begin
 case Tmenuitem(Sender).Tag of
  0,1: with TForm_budget.Create(nil) do//新增和编辑
       try
         Ftag:=Tmenuitem(Sender).Tag;
         initd;
         if showmodal=mrok then
         begin
           dm.ADODetail.Close;
           dm.ADODetail.Open;
         end;
       finally
         free;
         DM.ADODict_1.Close;
       end;
  2:  begin
        if MessageBox(Handle,'确定删除此数据吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOQuery1.Close;
        DM.ADOQuery1.SQL.Text:='delete from datadetail where rkey='+dm.ADODetailrkey.AsString;
        if DM.ADOQuery1.ExecSQL>0 then
        showmessage('删除数据成功！');
        btnRefreshClick(Sender);
      end;

 end;
end;
procedure Tfrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADODict.CommandText);
end;

procedure Tfrm_main.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADODetail.CommandText);
end;

procedure Tfrm_main.Grd1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ADODict.IndexFieldNames:=column.FieldName+' DESC';
  end
 else
  begin
    column.Title.SortMarker:=smupeh;
    dm.ADODict.IndexFieldNames:=column.FieldName;
  end;
  if column.ReadOnly then
  begin
    label1.Caption:=column.Title.Caption;
    column.Title.Color:=clred;
    precolumn1:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;
  DM.ADODict.Close;
  DM.ADODict.Open;
  DM.ADODetail.Close;
  DM.ADODetail.Open;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  precolumn1:=Grd1.Columns[0];
  precolumn2:=Grd2.Columns[0];
  
end;

end.

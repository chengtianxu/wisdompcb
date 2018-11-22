unit units;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, Mask, DBCtrls,
  Menus,ComObj, ComCtrls;

type
  Tfm_unit = class(TForm)
    lb_top: TLabel;
    btn_exit: TBitBtn;
    dg_grid: TDBGrid;
    ed_search: TEdit;
    lb_search: TLabel;
    pp_menu: TPopupMenu;
    pp_add: TMenuItem;
    pp_del: TMenuItem;
    pp_mod: TMenuItem;
    btn_export: TBitBtn;
    sb_bottom: TStatusBar;
    procedure btn_exitClick(Sender: TObject);
    procedure dg_gridTitleClick(Column: TColumn);
    procedure ed_searchChange(Sender: TObject);
    procedure pp_addClick(Sender: TObject);
    procedure pp_delClick(Sender: TObject);
    procedure pp_modClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_exportClick(Sender: TObject);
    procedure NmGridWnd (var Message : TMessage);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    OldGridWnd : TWndMethod;

  public
    { Public declarations }
  end;

var
  precolumn : TColumn;
  flag : Boolean;
  fm_unit: Tfm_unit;
  
implementation

uses mad,demo,common;

{$R *.dfm}

procedure Tfm_unit.btn_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Sort(psort : TColumn);
begin
  if flag then
            begin
              fm_demo.qry_adoqry.Sort := psort.DisplayName;
              psort.Title.Caption := psort.DisplayName + '▲';
              flag := false;
            end
  else
            begin
              fm_demo.qry_adoqry.Sort := psort.DisplayName + ' DESC';
              psort.Title.Caption := psort.DisplayName + '▼';
              flag := True;
            end;
end;

procedure Tfm_unit.dg_gridTitleClick(Column: TColumn);
begin
  if precolumn.DisplayName <> Column.DisplayName then
          begin
            precolumn.Title.Caption := precolumn.DisplayName;
            if (Column.Index < 2) and (Column.Index <> lb_search.Tag) then
              begin
                precolumn := dg_grid.Columns.Items[lb_search.tag];//tag用来判断颜色是否需要改变
                precolumn.Title.Color := clBtnFace;
                Column.Title.Color := clRed;
                lb_search.Caption := '搜索: ' + Column.DisplayName;
                lb_search.Tag :=Column.Index;
              end;
            precolumn := Column;
            flag := True;
            Sort(Column);
          end
  else
            Sort(Column);
end;

procedure Tfm_unit.ed_searchChange(Sender: TObject);
begin
  if Trim(ed_search.Text) <> '' then
          begin
                fm_demo.qry_adoqry.Filtered := True;
                case lb_search.Tag of
                  0: fm_demo.qry_adoqry.Filter := '单位代码 like ''%' + Trim(ed_search.Text) + '%''';
                  1: fm_demo.qry_adoqry.Filter := '单位名称 like ''%' + Trim(ed_search.Text) + '%''';
                end;
          end
  else
         fm_demo.qry_adoqry.Filtered := false;
end;

procedure Tfm_unit.pp_addClick(Sender: TObject);
begin
    fm_demo.qry_adoqry.Append;
    fm_demo.qry_adoqry.FieldValues['生产单位'] := 'N';
    fm_demo.qry_adoqry.FieldValues['采购单位'] := 'N';
    fm_demo.qry_adoqry.FieldValues['存货单位'] := 'N';
    fm_demo.qry_adoqry.FieldValues['报价单位'] := 'N';
    fm_mad.Caption := '添加单位';
    if fm_mad.ShowModal()=mrok then
              ShowMessage('单位添加成功');
end;

procedure Tfm_unit.pp_delClick(Sender: TObject);
begin
    if MessageDlg('你确定要删除吗？',mtConfirmation,[mbYes,mbNo],0) = mryes then
       begin
          fm_demo.qry_adoqry.Delete;
       end
end;

procedure Tfm_unit.pp_modClick(Sender: TObject);
begin
    fm_demo.qry_adoqry.Edit;
    fm_mad.Caption := '修改单位';
    if  fm_mad.ShowModal()=mrok then
                ShowMessage('单位修改成功');
end;

procedure Tfm_unit.FormShow(Sender: TObject);
begin
   if fm_demo.cn_adocon.Connected then
        begin
           fm_demo.qry_adoqry.Active := True;
           ed_search.SetFocus;
           flag := true;
           precolumn := dg_grid.Columns.Items[0];
           lb_search.Caption := '搜索: ' + precolumn.DisplayName;
           precolumn.Title.Color := clRed; //初始化precolumn
           Sort(precolumn);
        end;  
end;

procedure Tfm_unit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  precolumn.Free;
  fm_demo.qry_adoqry.Active := False;
  fm_demo.Free;
end;

procedure Tfm_unit.btn_exportClick(Sender: TObject);
var
    xlApp,xlBook,xlSheet,xlQuery : Variant;
begin
    try
        xlApp := CreateOleObject('Excel.Application');
    except
        ShowMessage('没有安装Excel或程序启动不正常');
        Exit;
    end;
      xlApp.caption := '单位查询结果';
      xlBook := xlApp.Workbooks.Add;

      xlSheet := xlBook.Worksheets['sheet1'];
      xlSheet.Name := '单位查询结果';
      xlApp.Visible := True; 
      xlQuery := xlSheet.QueryTables.Add(fm_demo.qry_adoqry.Recordset,xlSheet.Range['A1']);

      xlQuery.FieldNames := True;
      xlQuery.Refresh;
    
end;

procedure Tfm_unit.NmGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     dg_grid.DataSource.DataSet.MoveBy(1)
   else
     dg_grid.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure Tfm_unit.FormCreate(Sender: TObject);
begin

   if not app_init_2(fm_demo.cn_adocon) then
       begin
         ShowMsg('程序起动失败请联系管理员',1);
         application.Terminate;
       end; 
    OldGridWnd := dg_grid.WindowProc;
    dg_grid.WindowProc := NmGridWnd;
end;

end.

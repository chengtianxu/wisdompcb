unit rpt_model;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Menus, UMain, ExtCtrls;

type
  TFrmModel = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  FrmModel: TFrmModel;

implementation

uses  UDM;
{$R *.dfm}

procedure TFrmModel.item_click(sender: TObject);
begin
  Edit2.Text := (sender as tmenuItem).Caption;
end;

procedure TFrmModel.BitBtn1Click(Sender: TObject);
begin
  if Trim(Edit2.Text) = '' then
  begin
    ShowMessage('亲，您添加的显示项目名称为空哦，请输入后再按+按钮！');
    Exit;
  end;
  with   dbgrid1.Columns.Add   do
  begin
    Title.Caption := Trim(Edit2.Text);
    Visible := True;
    Width := 100;
  end;
  Edit2.clear;
end;

procedure TFrmModel.BitBtn4Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmModel.BitBtn3Click(Sender: TObject);
var
  i: Integer;
begin
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('亲，请输入模版名称啊！');
    Exit;
  end;
  if DBGrid1.Columns[0].Title.Caption = '' then
  begin
    ShowMessage('亲，您还没有添加显示项目名称呢！');
    Exit;
  end;
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into employeemsg_rpt_model values(' + quotedStr(Edit1.Text)
      + ',' + QuotedStr(DBGrid1.Columns[i].Title.Caption) + ',' + IntToStr(i) + ' )';
      ExecSQL;
    end;
  end;
  Edit1.Clear;
  dm.qryModel.Close;
  dm.qryModel.Open;
end;

procedure TFrmModel.BitBtn2Click(Sender: TObject);
begin
  dbgrid1.Columns.Delete(DBGrid1.Columns.Count - 1);
end;

procedure TFrmModel.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if dm.ADOConnection1.Connected then
  begin
      for i:=1 to Main_Form.DBGridEh1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := Main_Form.DBGridEh1.Columns[i-1].Title.Caption ;
          item.OnClick := item_click ;
          PopupMenu1.Items.Add(item) ;
      end;
      item := TmenuItem.Create(self) ;
      item.Caption := '离职类型' ;
      item.OnClick := item_click ;
      PopupMenu1.Items.Add(item) ;
  end;
  dm.qryModel.Close;
  dm.qryModel.Open;
end;

procedure TFrmModel.BitBtn5Click(Sender: TObject);
begin
  PopupMenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmModel.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TFrmModel.BitBtn9Click(Sender: TObject);
begin
  if dm.qryModel.RecordCount < 0 then
  begin
    ShowMessage('亲，眼睛瞅好了，当前是没有记录的，不能删除！');
    Exit;
  end;
  if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  with dm.tmp do
  begin
    SQL.Clear;
    SQL.Text := 'delete from employeemsg_rpt_model where model_name=' +quotedstr(dm.qryModel.FieldValues['model_name']);
    ExecSQL;
  end;
  DM.qryModel.Close;
  DM.qryModel.Open;
end;

end.

unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TMain_form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    CheckBox0: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }

    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck:string;
    FCondition:string;
    FisWrite,FisAudit,FisAudit_self:boolean;
    sqltxt: tstringList;
    procedure item_click(sender:TObject);
    procedure init;
  public
    { Public declarations }
  end;

var
  Main_form: TMain_form;

implementation

uses common,Udm,UAdEd;

{$R *.dfm}

procedure TMain_form.FormCreate(Sender: TObject);
begin
 { if not App_Init_2(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;   }
  Caption := application.Title;


 { dm.ADOCon.Open;
  rkey73:= '1502';
  user_ptr := '1838';
  vprev := '2';  }

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TMain_Form.init;
begin
    field_name := DBGridEh1.Columns[0].FieldName;
    PreColumn := DBGridEh1.Columns[0];
    DBGridEh1.Columns[0].Title.Color := clred ;
    DM.ADO686.close;
    DM.ADO686.Open;
end;

procedure TMain_form.BitBtn1Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TMain_form.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO686.IsEmpty then exit;
  i := DM.ADO686rkey.AsInteger ;
  DM.ADO686.Close;
  DM.ADO686.Open;
  DM.ADO686.Locate('rkey',i,[]);
end;

procedure TMain_form.BitBtn4Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'测试良率记录') ;
end;

procedure TMain_form.BitBtn6Click(Sender: TObject);
begin
    popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_Form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TMain_form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if dm.ADOConnection1.Connected then
  begin
      DBGridEh1TitleClick(PreColumn);
      for i:=1 to DBGridEh1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

          if DBGridEh1.Columns[i-1].Visible then
              item.Checked := true ;
              item.OnClick := item_click ;
              PopupMenu2.Items.Add(item) ;
      end;
  end;
end;

procedure TMain_form.DBGridEh1TitleClick(Column: TColumnEh);
begin
// if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO686.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO686.Sort:=Column.FieldName+' DESC';
  end;

  //if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
        label1.Caption:=column.Title.Caption;
        self.field_name:=column.FieldName;
        edit1.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
  end
  else
      edit1.SetFocus;
end;

procedure TMain_form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADO686.SQL.Text);
end;

procedure TMain_form.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADO687.SQL.Text);
end;

procedure TMain_form.N1Click(Sender: TObject);
begin

    case Tmenuitem(Sender).Tag of
    0,1: with TAdEd_form.Create(nil) do
       try

         if showmodal=mrok then
         begin

         end;
       finally

       end;
    end;
end;

end.

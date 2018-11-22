unit UDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus,daDataModule,math;

type
  TDetail_Form = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    PopupMenu2: TPopupMenu;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    //sSql :string;

    procedure item_click(sender:TObject);
    { Private declarations }
  public
    sdate:string;
    { Public declarations }
  end;

var
  Detail_Form: TDetail_Form;

implementation

uses UDM,common;

{$R *.dfm}

procedure TDetail_Form.BitBtn1Click(Sender: TObject);
begin
     dm.ADOInv_Stock.filter := '';
     DM.ADOStock1.Close;
     Self.Close;
end;

procedure TDetail_Form.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
        rkey:=dm.ADOInv_Stockrkey.Value;
        if dm.ADOInv_Stock.RecordCount > 0 then
        begin
            dm.ADOInv_Stock.Close;
            dm.ADOInv_Stock.Open;
            dm.ADOInv_Stock.Locate('rkey',rkey,[]);
        end;
end;

procedure TDetail_Form.BitBtn4Click(Sender: TObject);
begin
    if not dm.ADOInv_Stock.IsEmpty then
    Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TDetail_Form.BitBtn6Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TDetail_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
      if  DBGridEh1.DataSource.DataSet.Active then
      begin
            // if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
                 if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
                begin
                   column.Title.SortMarker:=smUpEh;
                   dm.ADOInv_Stock.Sort:=Column.FieldName;
                end
                else
                begin
                   column.Title.SortMarker:=smDownEh;
                    dm.ADOInv_Stock.Sort:=Column.FieldName+' DESC';
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
end;

procedure TDetail_Form.item_click(sender: TObject);
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

procedure TDetail_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if dm.ADOConnection1.Connected then
  begin
      DM.ADOInv_Stock.Close ;
      DM.ADOInv_Stock.SQL.Clear;
      DM.ADOInv_Stock.SQL.Text := sdate;
      //ShowMessage(DM.ADOInv_Stock.SQL.Text);
      DM.ADOInv_Stock.Open;
      //DM.ADOInv_Stock.Active :=True;
      field_name := DBGridEh1.Columns[0].FieldName;
      PreColumn := DBGridEh1.Columns[0];
      DBGridEh1.Columns[0].Title.Color := clred ;
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

procedure TDetail_Form.Edit1Change(Sender: TObject);
begin
       if trim(Edit1.text)<>'' then
        dm.ADOInv_Stock.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
        else dm.ADOInv_Stock.filter := '';
end;

end.

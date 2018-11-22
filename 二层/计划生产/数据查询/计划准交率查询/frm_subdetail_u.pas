unit frm_subdetail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, Menus, Clipbrd, common;

type
  Tfrm_subdetail = class(TForm)
    ds: TDataSource;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N0: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    qry: TADOQuery;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_subdetail: Tfrm_subdetail;

implementation

{$R *.dfm}

procedure Tfrm_subdetail.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then showmessage(qry.SQL.Text);
end;

procedure Tfrm_subdetail.N3Click(Sender: TObject);
begin
  N3.Checked:=NOT N3.Checked;
end;

procedure Tfrm_subdetail.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=qry.RecordCount>0;
  N2.Enabled:=qry.RecordCount>1;
  N3.Enabled:=N1.Enabled;
  N0.Enabled:=N1.Enabled;
end;

procedure Tfrm_subdetail.N5Click(Sender: TObject);
begin
  ShowMessage('复制的内容可以在EXCEL表格的某一个单元格为起点粘贴出来，'
              +#13#10+'通常会选择A1单元格。');
end;

procedure Tfrm_subdetail.N1Click(Sender: TObject);
var
  str:string;
  i,j:Integer;
begin
  str:='';
  if TMenuItem(Sender).Tag>0 then
  if N3.Checked then
  with TStringList.Create do
  begin
    Delimiter:=#9;
    for i:=0 to DBGridEh1.Columns.Count-1 do
    Add(DBGridEh1.Columns[i].Title.Caption);
    str:=DelimitedText+#13#10;
    Free;
  end;


  case TMenuItem(Sender).Tag of
  1:  begin
        with TStringList.Create do
        begin
          Delimiter:=#9;
          for i:=0 to DBGridEh1.Columns.Count-1 do
          Add(DBGridEh1.Columns[i].Field.AsString);
          str:=str+DelimitedText;
          Free;
        end;
        Clipboard.SetTextBuf(PChar(str));
      end;
  2:  begin
        for j:=0 to DBGridEh1.SelectedRows.Count-1 do
        with TStringList.Create do
        begin
          Delimiter:=#9;
          qry.Bookmark:=DBGridEh1.SelectedRows.items[j];
          for i:=0 to DBGridEh1.Columns.Count-1 do
          Add(DBGridEh1.Columns[i].DisplayText);
          str:=str+DelimitedText+#13#10;
          Free;
        end;
        Clipboard.SetTextBuf(PChar(str));
      end;
  3:  begin
        if MessageBox(Handle, '是否导出明细数据' + #13#10 + 
          '注:数据量大时会很慢，请耐心等待.', '注意', MB_YESNO) = IDYES then
        begin
          Export_dbGridEH_to_Excel(DBGridEh1,Caption);
        end;


      end;
  end;

end;

end.

unit PpCutting4_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, DBGridEh,StrUtils;

type
  TPpCutting4_frm = class(TForm)
    pnl2: TPanel;
    pnl1: TPanel;
    bt1: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    bt_OK: TButton;
    Button2: TButton;
    ds1: TDataSource;
    Dgh1: TDBGridEh;
    procedure Button2Click(Sender: TObject);
    procedure dgh1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure dgh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Dgh1TitleClick(Column: TColumnEh);
  private
    procedure cdsFilterRecord(DataSet: TDataSet;
         var Accept: Boolean);
    { Private declarations }
  public
    FilterFieldName:string;
    { Public declarations }
  end;

var
  PpCutting4_frm: TPpCutting4_frm;

implementation

uses PpCutting_1;

{$R *.dfm}

procedure TPpCutting4_frm.cdsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Trim(Edit1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(Edit1.Text )) ;
end;

procedure TPpCutting4_frm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TPpCutting4_frm.dgh1DblClick(Sender: TObject);
begin
  bt_OK.Click;
end;

procedure TPpCutting4_frm.Edit1Change(Sender: TObject);
begin
  with (Dgh1.DataSource.DataSet as TDataSet) do
  begin
    Filtered := False;
    Filter:=cds730_str_Filter;
    Filtered := true;
  end;
end;

procedure TPpCutting4_frm.bt1Click(Sender: TObject);
begin
  self.Edit1.Text:='';
end;

procedure TPpCutting4_frm.dgh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end;
end;

procedure TPpCutting4_frm.FormShow(Sender: TObject);
begin
  dgh1TitleClick(dgh1.FieldColumns['ABBR_NAME']) ;
  Dgh1.DataSource.DataSet.OnFilterRecord:= cdsFilterRecord;
end;

procedure TPpCutting4_frm.Dgh1TitleClick(Column: TColumnEh);
begin
   Label1.Caption:=Column.Field.DisplayLabel;
   Label1.Left:=5;
   Edit1.Left:=10+ Label1.Width;
   bt1.Left:= Edit1.Left+ Edit1.Width+5;
   CheckBox2.Left:=bt1.Left+bt1.Width+10;
   if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
   begin
     Edit1.Text:='';
     FilterFieldName:= Column.Field.FieldName;
   end;
end;

end.

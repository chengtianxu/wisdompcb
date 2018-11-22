unit mo_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmMOSearch = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Splitter1: TSplitter;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMOSearch: TFrmMOSearch;

implementation

{$R *.dfm}

procedure TFrmMOSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TFrmMOSearch.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
   Adoquery1.Filter :='cut_no like '''+Trim(Edit1.Text)+'%'''
 else
   Adoquery1.filter:='';
end;

procedure TFrmMOSearch.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

end.

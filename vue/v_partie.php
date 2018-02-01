<?php
include("include/entete.php");
?>
<table>
    <tr>
        <td class="espart">
            <form method='POST' action='index.php?uc=organisationnel&action=theme&nt=oui&entpied=theme'>
                <button type="submit" class="btn btn-danger btn-radius btn-partie" name="codepartie" value="1" >Organisationnel</button>
            </form>
        </td>
        <td class="espart">
            <form method='POST' action='index.php?uc=sursite&action=pole&nt=oui&entpied=pole'>
                <button type="submit" class="btn btn-danger btn-radius btn-partie" name="codepartie" value="2" >Sur site</button>
            </form>
        </td>
    </tr>
</table>
<?php
include("vue/v_generer.php");
?>